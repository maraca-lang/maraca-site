import { fromJs, parse as parseMaraca } from 'maraca';
import {
  createNodes,
  getChildren,
  pad,
  parse,
  parseValue,
  resize,
  updateNode,
} from 'maraca-render';
import * as prism from 'prismjs';

import printMaraca from './print';

import 'codemirror/lib/codemirror.css';

class WithPromises {
  resolved;
  current;
  stopped;
  update(..._) {}
  constructor(...promises) {
    Promise.all(promises).then(res => {
      if (!this.stopped) {
        this.resolved = res;
        this.run();
      }
    });
  }
  run() {
    this.update(...this.resolved, ...this.current);
  }
  render(...args) {
    this.current = args;
    if (this.resolved) this.run();
  }
  dispose() {
    this.stopped = true;
  }
}

const loadCodeMirror = async () => {
  const [{ default: CodeMirror }] = await Promise.all([
    import('codemirror'),
    import('codemirror/addon/mode/simple'),
  ]);
  CodeMirror.defineSimpleMode('maraca', {
    start: [
      { regex: /(\\(\S|\n)|_)/, token: 'string-2' },
      { regex: /\[|\(|\{/, token: 'attribute', indent: true },
      { regex: /\]|\)|\}/, token: 'attribute', dedent: true },
      { regex: /,/, token: 'attribute' },
      {
        regex: /((((\d+\.\d+)|([a-zA-Z0-9]+)) +)*((\d+\.\d+)|([a-zA-Z0-9]+)))?(:=\?|:=|:|=>>|=>)/,
        token: 'keyword',
      },
      { regex: /\?/, token: 'attribute' },
      { regex: /@@@|@@|@/, token: 'def' },
      { regex: /#((\d+\.\d+)|([a-zA-Z0-9]+))?/, token: 'def' },
      {
        regex: /->|<=|>=|==|<|>|=|\+|\-|\*|\/|%|\^|!|\.|\||\$/,
        token: 'operator',
      },
      { regex: /(\d+\.\d+)|([a-zA-Z0-9]+)/, token: 'number' },
      { regex: /"([^\\]|\\[\S\s])*?"/, token: 'string' },
      { regex: /'([^\\]|\\[\S\s])*?'/, token: 'string' },
      { regex: /`[^`]*`/, token: 'comment' },
    ],
    meta: {
      electricChars: '])}',
    },
  });
  // @ts-ignore
  window.CodeMirror = CodeMirror;
  return CodeMirror;
};

const languages = {
  ...prism.languages,
  maraca: {
    string: {
      pattern: /("([^\\]|\\[\S\s])*?")|('([^\\]|\\[\S\s])*?')|(\\(\S|\n)|_)/,
      greedy: true,
    },
    punctuation: /\[|\(|\{|\]|\)|\}|,|\?/,
    keyword: {
      pattern: /((((\d+\.\d+)|([a-zA-Z0-9]+)) +)*((\d+\.\d+)|([a-zA-Z0-9]+)))?(:=\?|:=|:|=>>|=>)/,
      greedy: true,
    },
    function: /(@@@|@@|@)|(#((\d+\.\d+)|([a-zA-Z0-9]+))?)/,
    operator: /->|<=|>=|==|<|>|=|\+|\-|\*|\/|%|\^|!|\.|\||\$/,
    number: { pattern: /(\d+\.\d+)|([a-zA-Z0-9]+)/, greedy: true },
    comment: { pattern: /`[^`]*`/, greedy: true },
  },
};

const isIndex = data => {
  if (data.type === 'list') return false;
  const s = data.value || '';
  const n = parseFloat(s);
  return !isNaN(s) && !isNaN(n) && n === Math.floor(n) && n > 0 && n;
};
const printValue = value => {
  if (value.type !== 'list') {
    return `"${(value.value || '').replace(
      /([<>"\\\n])/g,
      (_, m) => `\\${m}`,
    )}"`;
  }
  return `[${value.value
    .filter(v => v.value.value)
    .map(({ key, value }) =>
      isIndex(key)
        ? printValue(value)
        : `${printValue(key)}: ${printValue(value)}`,
    )
    .join(', ')}]`;
};

const formatCode = (prettier, plugin, code, printWidth?) => {
  try {
    parseMaraca(code);
    return prettier.format(code, {
      parser: 'maraca',
      plugins: [plugin],
      printWidth: Math.min(80, printWidth || 40),
    });
  } catch {
    return code;
  }
};

export default {
  code: class Code extends WithPromises {
    constructor(node) {
      super(import('prettier/standalone'), import('prettier-plugin-maraca'));
      createNodes(node, 'span');
    }
    static getInfo(values, context) {
      const { context: nextContext, ...style } = parse.style(values, context);
      const box = parse.box(values);
      const size = parse.size(values);
      const lang = parseValue(values.lang, 'string') || 'maraca';
      const value = parseValue(values['1'], 'string');
      return {
        props: { values, style, box, size, lang, value },
        context: nextContext,
      };
    }
    update(
      prettier,
      prettierMaraca,
      node,
      { values, style, box, size, lang, value },
      context,
    ) {
      const inner = getChildren(node)[0];

      updateNode(inner, style.props);
      setTimeout(() => {
        inner.innerHTML = prism.highlight(
          lang === 'maraca'
            ? formatCode(
                prettier,
                prettierMaraca,
                value,
                Math.ceil(node.offsetWidth / (context.size * 0.65)),
              )
            : value,
          languages[lang],
        );
        pad.node(inner, 'pad', box.pad);
        pad.text(inner, style.pad);
      });

      resize(node, values);
      updateNode(node, box.props, size.props);
    }
  },
  print: class Print extends WithPromises {
    constructor(node) {
      super(import('prettier/standalone'));
      createNodes(node, 'span');
    }
    static getInfo(values, context) {
      const { context: nextContext, ...style } = parse.style(values, context);
      const box = parse.box(values);
      const size = parse.size(values);
      const value = parseValue(values['1'], true);
      return {
        props: { values, style, box, size, value },
        context: nextContext,
      };
    }
    update(prettier, node, { values, style, box, size, value }, context) {
      const inner = getChildren(node)[0];

      updateNode(inner, style.props);
      setTimeout(() => {
        inner.innerHTML = prism.highlight(
          formatCode(
            prettier,
            printMaraca(prettier),
            printValue(value),
            Math.ceil(node.offsetWidth / (context.size * 0.8)),
          ),
          {
            string: /_/,
            punctuation: /\[|\]|,/,
            keyword: /((((\d+\.\d+)|([a-zA-Z0-9]+)) +)*((\d+\.\d+)|([a-zA-Z0-9]+)))?:\s/,
            number: /./,
          },
        );
        pad.node(inner, 'pad', box.pad);
        pad.text(inner, style.pad);
      });

      resize(node, values);
      updateNode(node, box.props, size.props);
    }
  },
  editor: class Editor extends WithPromises {
    constructor() {
      super(loadCodeMirror());
    }
    static getInfo(values, context) {
      const { context: nextContext, ...style } = parse.style(values, context);
      const box = parse.box(values);
      const size = parse.size(values);
      const value = parseValue(values.value, 'string', '');
      return {
        props: { values, style, box, size, value },
        context: nextContext,
      };
    }
    update(CodeMirror, node, { values, style, box, size, value }) {
      const setValue = values.value.set;
      node.style.height = '500px';
      if (!node.__editor) {
        node.__editor = CodeMirror(node, {
          value,
          mode: 'maraca',
          tabSize: 2,
          lineNumbers: true,
        });
        node.__editor.on('change', () => {
          setValue(fromJs(node.__editor.getDoc().getValue()));
        });
      }
      if (value !== node.__editor.getDoc().getValue()) {
        node.__editor.getDoc().setValue(value);
      }
      setTimeout(() => node.__editor.refresh());

      updateNode(node, style.props, box.props, size.props);
    }
  },
};

if (typeof window !== 'undefined') {
  const css = document.createElement('style');
  css.type = 'text/css';
  css.innerHTML = `
  code[class*="language-"],
  pre[class*="language-"] {
    color: black;
    background: none;
    text-shadow: 0 1px white;
    font-family: Consolas, Monaco, 'Andale Mono', 'Ubuntu Mono', monospace;
    text-align: left;
    white-space: pre;
    word-spacing: normal;
    word-break: normal;
    word-wrap: normal;
    line-height: 1.5;

    -moz-tab-size: 4;
    -o-tab-size: 4;
    tab-size: 4;

    -webkit-hyphens: none;
    -moz-hyphens: none;
    -ms-hyphens: none;
    hyphens: none;
  }

  pre[class*="language-"]::-moz-selection, pre[class*="language-"] ::-moz-selection,
  code[class*="language-"]::-moz-selection, code[class*="language-"] ::-moz-selection {
    text-shadow: none;
    background: #b3d4fc;
  }

  pre[class*="language-"]::selection, pre[class*="language-"] ::selection,
  code[class*="language-"]::selection, code[class*="language-"] ::selection {
    text-shadow: none;
    background: #b3d4fc;
  }

  @media print {
    code[class*="language-"],
    pre[class*="language-"] {
      text-shadow: none;
    }
  }

  /* Code blocks */
  pre[class*="language-"] {
    padding: 1em;
    margin: .5em 0;
    overflow: auto;
  }

  :not(pre) > code[class*="language-"],
  pre[class*="language-"] {
    background: #f5f2f0;
  }

  /* Inline code */
  :not(pre) > code[class*="language-"] {
    padding: .1em;
    border-radius: .3em;
    white-space: normal;
  }

  .token.comment,
  .token.prolog,
  .token.doctype,
  .token.cdata {
    color: slategray;
  }

  .token.punctuation {
    color: #999;
  }

  .namespace {
    opacity: .7;
  }

  .token.property,
  .token.tag,
  .token.boolean,
  .token.number,
  .token.constant,
  .token.symbol,
  .token.deleted {
    color: #905;
  }

  .token.selector,
  .token.attr-name,
  .token.string,
  .token.char,
  .token.builtin,
  .token.inserted {
    color: #690;
  }

  .token.operator,
  .token.entity,
  .token.url,
  .language-css .token.string,
  .style .token.string {
    color: #9a6e3a;
    background: hsla(0, 0%, 100%, .5);
  }

  .token.atrule,
  .token.attr-value,
  .token.keyword {
    color: #07a;
  }

  .token.function,
  .token.class-name {
    color: #DD4A68;
  }

  .token.regex,
  .token.important,
  .token.variable {
    color: #e90;
  }

  .token.important,
  .token.bold {
    font-weight: bold;
  }
  .token.italic {
    font-style: italic;
  }

  .token.entity {
    cursor: help;
  }
  `;
  document.body.appendChild(css);
}
