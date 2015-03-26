var webpack = require('webpack');

var buildFile = './build/' + process.env.BUILD_FILE;

module.exports = {
  entry: "./index.js",
  output: {
    filename: buildFile
  },
  module: {
    loaders: [
    ]
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {'NODE_ENV': JSON.stringify(process.env.NODE_ENV)}
    })
  ]
};
