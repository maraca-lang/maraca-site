import { toData } from 'maraca';
import * as webfont from 'webfontloader';

import data from './data';

webfont.load({
  google: { families: ['Montserrat:400,700', 'Source+Code+Pro:400,700'] },
});

export default (create, indexer) => ({
  data: create(indexer(), () => ({ initial: toData(data) })),
  tick: create(indexer(), ({ output }) => {
    let count = 0;
    const interval = setInterval(() => output(toData(count++)), 1000);
    return {
      initial: toData(count++),
      stop: () => clearInterval(interval),
    };
  }),
});
