import { fromJs, parse, toJs } from 'maraca';
import * as webfont from 'webfontloader';

webfont.load({
  google: { families: ['Montserrat:400,700', 'Source+Code+Pro:400,700'] },
});

const toDateData = (chrono, { type, value }) => {
  if (type !== 'value') return { type: 'nil' };
  const date = chrono.parseDate(value, new Date(), { forwardDate: true });
  return date ? { type: 'value', value: date.toISOString() } : { type: 'nil' };
};

const withPromises = (...promises) => {
  const func = promises.pop();
  let resolved;
  let current;
  let stopped = false;
  const run = () => func(...resolved, current);
  return value => {
    if (!value) {
      stopped = true;
    } else {
      current = value;
      if (!resolved) {
        Promise.all(promises).then(res => {
          if (!stopped) {
            resolved = res;
            run();
          }
        });
      } else {
        run();
      }
    }
  };
};

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
  '@': [
    emit => {
      let prev;
      let interval;
      return withPromises(import('chrono-node'), (chrono, value) => {
        if (interval) clearInterval(interval);
        if (value) {
          const update = () => {
            const next = toDateData(chrono, value);
            if (!prev || next.value !== prev.value) emit(next);
            prev = next;
          };
          update();
          interval = setInterval(update, 1000);
        }
      });
    },
  ],
  '#': {
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
  },
};
