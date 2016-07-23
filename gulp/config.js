var dest = './build',
  src = './src',
  mui = './node_modules/material-ui/src';

module.exports = {
  browserSync: {
    proxy: 'localhost:5000',
    files: [
      dest + '/**'
    ]
  },
  browserify: {
    // Enable source maps
    debug: true,
    // A separate bundle will be generated for each
    // bundle config in the list below
    bundleConfigs: [{
      entries: src + '/app/app.cjsx',
      dest: dest,
      outputName: 'app.js'
    }],
    extensions: ['.js', '.cjsx', '.coffee'],
  }
};
