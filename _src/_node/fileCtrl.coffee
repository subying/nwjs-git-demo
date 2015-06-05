###
	文件相关
###

fs = require 'fs'

fileCtrl = 
	findDir: (dir) ->
		files.forEach (n,i) ->
			stat = fs.lstatSync n
			#判断是否为文件夹
			if stat.isDirectory()
				console.log n

	isDir: (dir) ->
		dir = dir.replace(/\\/g,'//')
		if fs.existsSync(dir)
			stat = fs.lstatSync dir
			if stat.isDirectory()
				return true
			else
				return false
		else
			return false
	_json: []
	saveHistory: (dir) ->
		dir = dir.replace(/\\/g,'//')
		_flag = false
		
		for item,index in @_json
			if dir is item
				_flag = true

		if not _flag
			@_json.push dir
			


module.exports = fileCtrl