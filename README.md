# grafana_scripted_starter

> when you want to build a grafana scripted dashboard, but also want cjs, npm, and an actual build


## Usage

### Clone and reset git repo

``` sh
git clone <this-repo> <your-project-name>
cd <your-project-name>
rm -rf .git
git init
git add .
git commit -m 'initial'
npm install
```

### Update package.json

* Change your project name, version, description, author, and license
* Change `scripts.build` and `scripts.dev`, set `BUILD_FILE` equal to your project name.
  * `BUILD_FILE` is the file that will be built for development and the actual build


## Local Dev


### Setup a local grafana

Download [`grafana`](http://grafana.org/download/) to a sibling directory (or
change `OUTPUT_PATH` in `script/dev_fixup.sh`). Setup a `config.js` file for
grafana (see [grafana config docs](http://docs.grafana.org/installation/) for
details).  Run a local
[`http-server`](https://www.npmjs.com/package/http-server) in the grafana
project.

You can also clone the [`grafana`](https://github.com/grafana/grafana) repo and
run it using it's grunt tasks. You'll need to update the `OUTPUT_PATH` in
`scripts/dev_fixup.sh` to correctly get your built dashboard script file into
the `dashboards` directory of grafana.

### Build your scripted dashboard

`npm run dev`. It'll watch for file changes and build your dashboard into grafana for you.

`npm test` to run tests.


## Build It

When you're ready, `npm run build` to build a minified version into a `build` directory.


## Notes

Grafana loads your script as the body of a `new Function` (see
[here](https://github.com/grafana/grafana/blob/master/src%2Fapp%2Froutes%2Fstandalone%2FfromScript.js#L33)
for details). This means that we need to prepend a return statement to the
webpack built file. The files in `script` will take care of this for you, and
happens automatically when you use `npm run build` or `npm run dev`.

Your main file (`index.js`) needs to export either a grafana `dashboard` object  or
a function (for async scripted dashboards).


```javascript
// index.js for a sync dashboard

var dashboard = {};
// build your dashboard
module.exports = dashboard
```

```javascript
// index.js for an async dashboard

module.exports = function(callback) {
  var dashboard = {};
  // do async stuff and when ready, execute the callback with your dashboard
  callback(dashboard);
}
```
