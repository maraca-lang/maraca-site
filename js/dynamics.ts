import * as chrono from 'chrono-node';

const toDateData = ({ type, value }) => {
  if (type !== 'value') return { type: 'nil' };
  const date = chrono.parseDate(value, new Date(), { forwardDate: true });
  return date ? { type: 'value', value: date.toISOString() } : { type: 'nil' };
};

export default [
  arg => ({ get, output }) => {
    let prev = toDateData(get(arg));
    const tryOutput = () => {
      const next = toDateData(get(arg));
      if (next.value !== prev.value) output(next);
      prev = next;
    };
    let interval = setInterval(tryOutput, 1000);
    return {
      initial: prev,
      update: () => {
        clearInterval(interval);
        tryOutput();
        interval = setInterval(tryOutput, 1000);
      },
      stop: () => clearInterval(interval),
    };
  },
];
