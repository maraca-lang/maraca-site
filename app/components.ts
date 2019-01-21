import { parse, toData } from 'maraca';
import { createNode, getSetters, getValues } from 'maraca-render';
import * as CodeMirror from 'codemirror';
import * as prettier from 'prettier/standalone';
import * as prettierMaraca from 'prettier-plugin-maraca';

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

export default {
  code: (node, values) => {
    const result = node || createNode('div');
    const { value = '', format } = getValues(values, {
      value: 'string',
      format: true,
    });
    const setters = getSetters(values, {}, { value: true })[1];
    result.style.height = '600px';
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
};
