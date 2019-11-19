import { withPromises } from './utils';

const toDateData = (chrono, { type, value }) => {
  if (type !== 'value') return { type: 'nil' };
  const date = chrono.parseDate(value, new Date(), { forwardDate: true });
  return date ? { type: 'value', value: date.toISOString() } : { type: 'nil' };
};

export default [
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
];
