import { fromJs, print, resolve, streamMap, toJs } from 'maraca';
import * as prism from 'prismjs';

import './style.css';
import './prism.css';

import parseColor from './color';

const printHTML = (data) => {
  if (data.type == 'value') return data.value;
  const { '': tag = 'div', style = {}, ...props } = toJs(data, {
    '': 'string',
    style: { '*': 'string' },
    '*': 'string',
  });
  const css = Object.keys(style)
    .sort()
    .map((k) => `${k}: ${style[k]};`)
    .join(' ');
  if (css) props.style = css;
  const attrs = Object.keys(props)
    .sort()
    .map((k) => `${k}="${props[k]}"`)
    .join(' ');
  const content = data.value.indices.map((d) => printHTML(d)).join('');
  return `<${tag || 'div'} ${attrs}>${content}</${tag || 'div'}>`;
};

const map = (func) =>
  fromJs((x) => streamMap((get) => fromJs(func(resolve(x, get)))));
const mapWithPromises = (...args) => {
  const func = args.pop();
  return fromJs((x) => (set, get) => {
    let resolved;
    let current;
    let stopped;
    const run = () => set(fromJs(func(...resolved, ...current)));
    Promise.all(args).then((res) => {
      if (!stopped) {
        resolved = res;
        run();
      }
    });
    return (dispose) => {
      if (dispose) {
        stopped = true;
      } else {
        current = resolve(x, get);
        if (resolved) run();
      }
    };
  });
};
const mathMap = (func) => map((x) => func(toJs(x, ['number']) || []));

const languages = {
  ...prism.languages,
  maraca: {
    plain: {
      pattern: /"([^\\]|\\[\S\s])*?"/,
      inside: { plain: { pattern: /<[^\\]*\/>/ } },
    },
    punctuation: /\[|\(|\{|<|\]|\)|\}|\/>|,/,
    keyword: {
      pattern: /(((([a-zA-Z0-9]+) +)*([a-zA-Z0-9]+))|('([^\\]|\\[\S\s])*?'))?(:=\?|:=|:~|:|=>>|=>|->)/,
    },
    string: {
      pattern: /(\@)(((([a-zA-Z0-9]+) +)*([a-zA-Z0-9]+))|('([^\\]|\\[\S\s])*?'))/,
    },
    operator: /<=|>=|<|>|=|\+|\-|\*|\/|%|\^|!|\.|\||>>|#/,
    number: {
      pattern: /([a-zA-Z0-9]+)|('([^\\]|\\[\S\s])*?')/,
      greedy: true,
    },
    function: { pattern: /(\\(\S|\n)|_)/ },
  },
};
languages.maraca.plain.inside.plain.inside = { rest: languages.maraca };

export default {
  parseColor: map((color) =>
    parseColor(color.type === 'value' ? color.value : ''),
  ),
  print: map((v) => print(v, (x) => x)),
  printhtml: map((v) => printHTML(v)),
  prettier: mapWithPromises(
    import('prettier/standalone'),
    import('prettier-plugin-maraca'),
    (prettier, prettierMaraca, x) => {
      try {
        const { 1: code = '', 2: width = 1000 } = toJs(x, {
          1: 'string',
          2: 'number',
        });
        try {
          return prettier.format(code, {
            parser: 'maraca',
            plugins: [prettierMaraca],
            printWidth: Math.floor(parseFloat(width)),
          });
        } catch {
          return code;
        }
      } catch {
        return '';
      }
    },
  ),
  prettierhtml: mapWithPromises(
    import('prettier/standalone'),
    import('prettier/parser-html'),
    (prettier, prettierHTML, x) => {
      try {
        const { 1: code = '', 2: width = 1000 } = toJs(x, {
          1: 'string',
          2: 'number',
        });
        try {
          return prettier.format(code, {
            parser: 'html',
            plugins: [prettierHTML],
            printWidth: Math.floor(parseFloat(width)),
            htmlWhitespaceSensitivity: 'ignore',
          });
        } catch {
          return code;
        }
      } catch {
        return '';
      }
    },
  ),
  prism: map((x) => {
    try {
      const { 1: code = '', 2: lang = 'maraca' } = toJs(x, {
        1: 'string',
        2: 'string',
      });
      return prism.highlight(code, languages[lang]);
    } catch {
      return '';
    }
  }),
  sum: mathMap((values) => values.reduce((res, x) => res + x, 0)),
  average: mathMap(
    (values) => values.reduce((res, x) => res + x, 0) / values.length,
  ),
  minimum: mathMap((values) => Math.min(...values)),
  maximum: mathMap((values) => Math.max(...values)),
  tick: (set) => {
    let count = 1;
    set(fromJs(count++));
    const interval = setInterval(() => set(fromJs(count++)), 1000);
    return (dispose) => dispose && clearInterval(interval);
  },
};
