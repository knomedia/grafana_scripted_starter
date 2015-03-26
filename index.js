/*
 * vars in this scope from grafana
 * window, document, ARGS, $, jQuery, moment, kbn;
*/

// grafana will call this function and pass a callback function.
// execute the callback with your dashboard once it's ready
function asyncGraph(callback) {
  var dashboard = {};

  window.setTimeout(function() {
    callback(dashboard);
  }, 1);
}

module.exports = asyncGraph;
