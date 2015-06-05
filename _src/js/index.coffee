fileCtrl = require '../_node/fileCtrl'
cmd = require '../_node/cmd'


_gitPath = 'D:\\Progra~1\\Git\\cmd\\git.exe'

fileDrag = $('#fileDrag')
#阻止冒泡
window.ondragover = (e)->
	e.preventDefault()
	return false

window.ondrop = (e)->
	e.preventDefault()
	return false

#绑定事件
fileDrag[0].ondragover=(e) ->
	e.preventDefault()
	return false

fileDrag[0].ondrop=(e) ->
	for item,index in e.dataTransfer.files
		if fileCtrl.isDir(item.path)
			fileCtrl.saveHistory item.path

	filePad.append fileCtrl._json
	e.preventDefault()
	return false 

$('#gitPull').on 'click',->
	arr = fileCtrl._json
	arr.forEach (item,index) ->
		cmd.exec ['cd '+item,filePad.pullCmd],filePad.cmdCb

filePad = 
	append: (arr) ->#插入html
		_html = ''
		arr.forEach (item,index) ->
			_html = _html + "<p>#{item}</p>"

		fileDrag.html _html
	cmdCb: (error, stdout, stderr, str) ->
		if error
			throw error
		else
			$('#logPad').append "#{str}<p>#{stdout}</p>"
	pullCmd: _gitPath + ' pull'
