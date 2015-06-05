exec = require('child_process').exec

cmd = 
	exec: (arr,cb) -> #arr 由命令组成的数组
		arr = arr or []
		_cmdStr = ''
		arr.forEach (item,index) ->
			if _cmdStr
				_cmdStr = _cmdStr + ' && ' + item
			else
				_cmdStr = _cmdStr + item

		exec _cmdStr,(error, stdout, stderr) ->
			cb = cb or ->
			cb error,stdout,stderr

module.exports = cmd