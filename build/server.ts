import * as path from 'path';
import * as express from 'express';
import * as tinylr from 'tiny-lr';
import * as chokidar from 'chokidar';
import * as livereload from 'connect-livereload';

let count = 0;
const load = () => {
  count++;
  if (count === 2) console.log('Listening on port 8080');
};

tinylr().listen(35729, load);

express()
  .use(livereload({ port: 35729 }))
  .use(express.static('public', { extensions: ['html'] }))
  .listen(8080, load);

chokidar.watch('public/*', { ignored: /[\/\\]\./ }).on('change', filePath => {
  tinylr.changed(path.resolve(__dirname + '/' + filePath));
});
