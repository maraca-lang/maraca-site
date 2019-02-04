import { createMethod, toData, toTypedValue } from 'maraca';
import * as webfont from 'webfontloader';

webfont.load({
  google: { families: ['Montserrat:400,700', 'Source+Code+Pro:400,700'] },
});

const map = m => ({ initial, output }) => ({
  initial: toData(m(initial)),
  update: value => output(toData(m(value))),
});

export default (create, indexer) => ({
  data: create(indexer(), () => ({
    initial: toData({
      A: { Name: 'Sue' },
      B: { Name: 'Bob' },
      C: { Name: 'Joe' },
    }),
  })),
  tick: create(indexer(), ({ output }) => {
    let count = 0;
    const interval = setInterval(() => output(toData(count++)), 1000);
    return {
      initial: toData(count++),
      stop: () => clearInterval(interval),
    };
  }),
  slowtick: create(indexer(), ({ output }) => {
    let count = 0;
    const interval = setInterval(() => output(toData(count++)), 2000);
    return {
      initial: toData(count++),
      stop: () => clearInterval(interval),
    };
  }),
  date: createMethod(
    create,
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
});

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
