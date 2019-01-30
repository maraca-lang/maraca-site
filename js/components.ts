import { parse, toData } from 'maraca';
import {
  createNode,
  getSetters,
  getValues,
  parseValue,
  updateBox,
} from 'maraca-render';
import * as CodeMirror from 'codemirror';
import * as prettier from 'prettier/standalone';
import * as prettierMaraca from 'prettier-plugin-maraca';
import * as prism from 'prismjs';

// @ts-ignore
window.CodeMirror = CodeMirror;
import 'codemirror/addon/mode/simple';
import 'codemirror/lib/codemirror.css';

CodeMirror.defineSimpleMode('maraca', {
  start: [
    { regex: /'\S/, token: 'string' },
    { regex: /\[|\(|\{/, token: 'attribute', indent: true },
    { regex: /\]|\)|\}/, token: 'attribute', dedent: true },
    { regex: /,/, token: 'attribute' },
    {
      regex: /((\\d+\\.\\d+)|([a-zA-Z0-9]+))?(:=\\?|:=|::|:|=>>|=>|~)/,
      token: 'keyword',
    },
    { regex: /\?/, token: 'attribute' },
    { regex: /(@@@|@@|@|##|#)((\d+\.\d+)|([a-zA-Z0-9]+))?/, token: 'def' },
    { regex: /<=|>=|==|<|>|=|\+|\-|\*|\/|%|\^|!|\./, token: 'operator' },
    { regex: /(\d+\.\d+)|([a-zA-Z0-9]+)/, token: 'number' },
    { regex: /"/, token: 'string', push: 'string' },
  ],
  string: [
    { regex: /[^"]+/, token: 'string' },
    { regex: /""/, token: 'string-2' },
    { regex: /"(?!")/, token: 'string', pop: true },
  ],
  meta: {
    electricChars: '])}',
  },
});

const formatCode = code => {
  try {
    parse(code);
    return prettier.format(code, {
      parser: 'maraca',
      plugins: [prettierMaraca],
    });
  } catch {
    return code;
  }
};

const getChildren = node =>
  node && ([] as any).slice.call(node.childNodes).filter(c => c.__maraca);
const findChild = (node, depth) =>
  Array.from({ length: depth }).reduce(res => res && getChildren(res)[0], node);

export default {
  editor: (node, values) => {
    const result = node || createNode('div');
    const { value = '', format } = getValues(values, {
      value: 'string',
      format: true,
    });
    const setters = getSetters(values, {}, { value: true })[1];
    result.style.height = '500px';
    if (!result.__editor) {
      result.__editorFormat = format;
      result.__editor = CodeMirror(result, {
        value,
        mode: 'maraca',
        tabSize: 2,
        lineNumbers: true,
      });
      result.__editor.on('change', () => {
        setters.value(toData(result.__editor.getDoc().getValue()));
      });
    }
    const formatted =
      format === result.__editorFormat ? value : formatCode(value);
    result.__editorFormat = format;
    if (formatted !== value) {
      setters.value(toData(formatted));
    }
    if (formatted !== result.__editor.getDoc().getValue()) {
      result.__editor.getDoc().setValue(formatted);
    }
    setTimeout(() => result.__editor.refresh());
    return result;
  },
  code: (node, values, indices, context) =>
    updateBox(node, values, context, inner => {
      let child = findChild(inner, 1);
      if (!child) {
        child = createNode('span');
        inner.appendChild(child);
      }
      child.innerHTML = prism.highlight(
        parseValue('string', indices[0]),
        prism.languages.javascript,
      );
    }),
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
