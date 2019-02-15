import * as chrono from 'chrono-node';
import { toData, toTypedValue } from 'maraca';
import * as webfont from 'webfontloader';

webfont.load({
  google: { families: ['Montserrat:400,700', 'Source+Code+Pro:400,700'] },
});

const map = m => emit => value => emit(toData(m(value)));

const toDateData = ({ type, value }) => {
  if (type !== 'value') return { type: 'nil' };
  const date = chrono.parseDate(value, new Date(), { forwardDate: true });
  return date ? { type: 'value', value: date.toISOString() } : { type: 'nil' };
};

export default {
  '@': [
    emit => {
      let prev;
      let interval;
      return value => {
        if (interval) clearInterval(interval);
        if (value) {
          const update = () => {
            const next = toDateData(value);
            if (!prev || next.value !== prev.value) emit(next);
            prev = next;
          };
          update();
          interval = setInterval(update, 1000);
        }
      };
    },
  ],
  '#': {
    data: toData({
      A: { Name: 'Sue' },
      B: { Name: 'Bob' },
      C: { Name: 'Joe' },
    }),
    tick: emit => {
      let count = 0;
      emit(toData(count++));
      const interval = setInterval(() => emit(toData(count++)), 1000);
      return () => clearInterval(interval);
    },
    slowtick: emit => {
      let count = 0;
      emit(toData(count++));
      const interval = setInterval(() => emit(toData(count++)), 2000);
      return () => clearInterval(interval);
    },
    date: toData(
      map(x => {
        const v = toTypedValue(x);
        if (v.type !== 'time') return null;
        return [
          (`${v.value.getDate()}` as any).padStart(2, '0'),
          (`${v.value.getMonth() + 1}` as any).padStart(2, '0'),
          `${v.value.getFullYear()}`.slice(2),
        ].join('/');
      }),
    ),
  },
};

// arg => ({ get, output }) => {
//   let interval;
//   const run = () => {
//     let count = 0;
//     const inc = toTypedValue(get(arg));
//     if (inc.type === 'number') {
//       interval = setInterval(() => output(toData(count++)), inc.value * 1000);
//       return toData(count++);
//     }
//     return toData(null);
//   };
//   return {
//     initial: run(),
//     update: () => {
//       clearInterval(interval);
//       output(run());
//     },
//     stop: () => clearInterval(interval),
//   };
// },

// const geocodeCache = {};
// const geocodeListeners = {};

// arg => ({ get, output }) => {
//   let unlisten;
//   const run = () => {
//     const { type, value } = get(arg);
//     if (unlisten) unlisten();
//     if (type === 'value') {
//       if (!geocodeCache[value]) {
//         if (!geocodeListeners[value]) {
//           geocodeListeners[value] = [];
//           (async () => {
//             const result = await (await fetch(
//               `https://maps.googleapis.com/maps/api/geocode/json?address=${encodeURIComponent(
//                 value,
//               )}&key=AIzaSyCQ8P7-0kTGz2_tkcHjOo0IUiMB_z9Bbp4`,
//             )).json();
//             geocodeCache[value] = toData(
//               JSON.stringify(result.results[0].geometry.location),
//             );
//             geocodeListeners[value].forEach(l => l());
//             geocodeListeners[value] = null;
//           })();
//         }
//         const listener = () => output(geocodeCache[value]);
//         geocodeListeners[value].push(listener);
//         unlisten = () =>
//           geocodeListeners[value].splice(
//             geocodeListeners[value].indexOf(listener),
//             1,
//           );
//         return { type: 'nil' };
//       }
//       return geocodeCache[value];
//     }
//   };
//   return { initial: run(), update: output(run()) };
// },

// time: createMethod(
//   create,
//   map(x => {
//     const v = toTypedValue(x);
//     if (v.type !== 'time') return null;
//     return [
//       `${v.value.getDate()}`.padStart(2, '0'),
//       `${v.value.getMonth() + 1}`.padStart(2, '0'),
//       `${v.value.getFullYear()}`.slice(2),
//     ].join('/');
//   }),
// ),
// duration: createMethod(
//   create,
//   map(x => {
//     const { type, value } = toTypedValue(x);
//     return type === 'number' && moment.duration(value).humanize();
//   }),
// ),
// floor: createMethod(
//   create,
//   map(x => {
//     const { type, value } = toTypedValue(x);
//     return type === 'number' && Math.floor(value);
//   }),
// ),
// ceil: createMethod(
//   create,
//   map(x => {
//     const { type, value } = toTypedValue(x);
//     return type === 'number' && Math.ceil(value);
//   }),
// ),
// round: createMethod(
//   create,
//   map(x => {
//     const { type, value } = toTypedValue(x);
//     return type === 'number' && Math.round(value);
//   }),
// ),
// range: createMethod(
//   create,
//   map(x => {
//     const { type, value } = toTypedValue(x);
//     return (
//       type === 'number' && Array.from({ length: value }).map((_, i) => i + 1)
//     );
//   }),
// ),
