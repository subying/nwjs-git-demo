// Generated by CoffeeScript 1.9.2
var cmd, exec;

exec = require('child_process').exec;

cmd = {
  exec: function(arr, cb) {
    var _cmdStr;
    arr = arr || [];
    _cmdStr = '';
    arr.forEach(function(item, index) {
      if (_cmdStr) {
        return _cmdStr = _cmdStr + ' && ' + item;
      } else {
        return _cmdStr = _cmdStr + item;
      }
    });
    return exec(_cmdStr, function(error, stdout, stderr) {
      cb = cb || function() {};
      return cb(error, stdout, stderr);
    });
  }
};

module.exports = cmd;
