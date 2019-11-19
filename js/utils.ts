export const withPromises = (...promises) => {
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
