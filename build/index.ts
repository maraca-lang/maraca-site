import * as path from 'path';
import * as fs from 'fs-extra';
import * as chokidar from 'chokidar';
import * as sass from 'node-sass';
import * as yargs from 'yargs';

const toHtml = maraca => `
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8">
      <title>Maraca</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"></link>
      <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Source+Code+Pro:400,700" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
      <div data-maraca style="display: none">
        ${maraca}
      </div>
      <script type="text/javascript" src="maraca.js"></script>
    </body>
  </html>
`;

const root = path.join(__dirname, '../');
fs.removeSync(root + 'public');
fs.ensureDirSync(root + 'public');
fs.copySync(root + 'build/maraca.js', root + 'public/maraca.js');
fs.copySync(root + 'img', root + 'public');

if (!yargs.argv.w) {
  fs.writeFileSync(
    root + `public/style.css`,
    sass.renderSync({ file: root + 'build/style.scss' }).css.toString(),
  );
  fs.readdirSync(root + 'pages').forEach(file => {
    const fileName = file.replace(/^.*[\\\/]/, '').split('.')[0];
    fs.writeFileSync(
      root + `public/${fileName}.html`,
      toHtml(fs.readFileSync(root + `pages/${fileName}.tl`)),
    );
  });
} else {
  let count = 0;
  const load = () => {
    count++;
    if (count === 2) console.log('Watching for changes');
  };
  chokidar
    .watch(root + 'build/style.scss')
    .on('all', (event, file) => {
      if (event === 'add' || event === 'change') {
        try {
          fs.writeFileSync(
            root + `public/style.css`,
            sass.renderSync({ file }).css.toString(),
          );
        } catch {}
      }
    })
    .on('ready', load);

  chokidar
    .watch(root + 'pages/*')
    .on('all', (event, file) => {
      const fileName = file.replace(/^.*[\\\/]/, '').split('.')[0];
      if (event === 'add' || event === 'change') {
        fs.writeFileSync(
          root + `public/${fileName}.html`,
          toHtml(fs.readFileSync(root + `pages/${fileName}.tl`)),
        );
      } else if (event === 'unlink') {
        fs.removeSync(root + `public/${fileName}.html`);
      }
    })
    .on('ready', load);
}
