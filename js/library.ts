import { fromJs, parse, toJs } from 'maraca';

import { withPromises } from './utils';

const formatCode = (prettier, plugin, code, printWidth?) => {
  try {
    parse(code);
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
  data: fromJs({
    A: { Name: 'Sue' },
    B: { Name: 'Bob' },
    C: { Name: 'Joe' },
  }),
  tick: emit => {
    let count = 1;
    emit(fromJs(count++));
    const interval = setInterval(() => emit(fromJs(count++)), 1000);
    return () => clearInterval(interval);
  },
  slowtick: emit => {
    let count = 0;
    emit(fromJs(count++));
    const interval = setInterval(() => emit(fromJs(count++)), 2000);
    return () => clearInterval(interval);
  },
  date: fromJs(emit => value => {
    if (value) {
      const v = toJs(value);
      emit(
        fromJs(
          Object.prototype.toString.call(v) !== '[object Date]'
            ? null
            : [
                (`${v.getDate()}` as any).padStart(2, '0'),
                (`${v.getMonth() + 1}` as any).padStart(2, '0'),
                `${v.getFullYear()}`.slice(2),
              ].join('/'),
        ),
      );
    }
  }),
  format: fromJs(emit =>
    withPromises(
      import('prettier/standalone'),
      import('prettier-plugin-maraca'),
      (prettier, prettierMaraca, value) => {
        emit(fromJs(formatCode(prettier, prettierMaraca, toJs(value))));
      },
    ),
  ),
};
