import { fromJs, print } from 'maraca';
import * as prism from 'prismjs';

import './prism.css';

import parseColor from './color';

const toNumber = (v: string) => {
  const n = parseFloat(v);
  return !isNaN(v as any) && !isNaN(n) ? n : null;
};
const toIndex = (v: string) => {
  const n = toNumber(v);
  return n !== null && n === Math.floor(n) && n > 0 ? n : null;
};
const toJs = (data) => {
  if (data.type === 'value') return data.value;
  const result = { indices: [] as any[], values: {} };
  for (const { key, value } of data.value.toPairs()) {
    if (key.type === 'value') {
      if (toIndex(key.value)) result.indices.push(toJs(value));
      else result.values[key.value] = toJs(value);
    }
  }
  if (result.indices.length === 0) return result.values;
  if (Object.keys(result.values).length === 0) return result.indices;
  return result;
};

const printString = (data) => {
  if (data.type === 'value') return data.value;
  return '';
};
const printCSS = (data) => {
  if (data.type === 'value') return '';
  return data.value
    .toPairs()
    .filter(
      ({ key, value }) =>
        key.type === 'value' && value.type === 'value' && value.value,
    )
    .map(({ key, value }) => `${key.value}: ${value.value};`)
    .join(' ');
};
const printHTML = (data) => {
  if (data.type == 'value') return data.value;
  const result = { tag: '', indices: [] as any[], values: {} };
  for (const { key, value } of data.value
    .toPairs()
    .filter((x) => x.key.type === 'value' && x.value.value)) {
    if (!key.value) result.tag = printString(value);
    else if (toIndex(key.value)) result.indices.push(value);
    else result.values[key.value] = value;
  }
  return `<${result.tag || 'div'} ${Object.keys(result.values)
    .sort()
    .map((k) => {
      const s =
        k === 'style'
          ? printCSS(result.values[k])
          : printString(result.values[k]);
      return s && `${k}="${s}"`;
    })
    .filter((s) => s)
    .join(' ')}>${result.indices.map((d) => printHTML(d)).join('')}</${
    result.tag || 'div'
  }>`;
};

const map = (func) =>
  fromJs((x) => (set, get) => () => set(fromJs(func(get(x, true)))));
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
        current = get(x, true);
        if (resolved) run();
      }
    };
  });
};
const mathMap = (func) =>
  map((x) => {
    const v = toJs(x);
    if (!Array.isArray(v)) return null;
    const nums = v.map((a) => toNumber(a));
    if (nums.some((n) => n === null)) return null;
    return func(nums);
  });

const languages = {
  ...prism.languages,
  maraca: {
    string: {
      pattern: /"([^\\]|\\[\S\s])*?"/,
      greedy: true,
      inside: {
        string: {
          pattern: /<[^\\]*\/>/,
        },
      },
    },
    punctuation: /\[|\(|\{|<|\]|\)|\}|\/>|,|\?/,
    keyword: {
      pattern: /((((\d+\.\d+)|([a-zA-Z0-9]+)) +)*((\d+\.\d+)|([a-zA-Z0-9]+)))?(:=\?|:=|:|=>>|=>)/,
      greedy: true,
    },
    operator: /->|<=|>=|<|>|~|=|\+|\-|\*|\/|%|\^|!|\.|\||>>|#/,
    number: {
      pattern: /(\d+\.\d+)|([a-zA-Z0-9]+)|('([^\\]|\\[\S\s])*?')/,
      greedy: true,
    },
    function: { pattern: /(\\(\S|\n)|_)/, greedy: true },
    comment: { pattern: /`[^`]*`/, greedy: true },
  },
};
languages.maraca.string.inside.string.inside = { rest: languages.maraca };

export default {
  parseColor: map((color) =>
    parseColor(color.type === 'value' ? color.value : ''),
  ),
  print: map((v) => print(v)),
  printhtml: map((v) => printHTML(v)),
  prettier: mapWithPromises(
    import('prettier/standalone'),
    import('prettier-plugin-maraca'),
    (prettier, prettierMaraca, x) => {
      try {
        const v = toJs(x);
        const [code, width = 1000] = Array.isArray(v) ? v : [v];
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
        const v = toJs(x);
        const [code, width = 1000] = Array.isArray(v) ? v : [v];
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
      const v = toJs(x);
      const [code, lang = 'maraca'] = Array.isArray(v) ? v : [v];
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
