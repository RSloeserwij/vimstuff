
let g:tagbar_type_ansible = { 'ctagstype' : 'ansible', 'kinds' : [ 't:tasks' ], 'sort' : 0 }	
let g:indentLine_enabled = 1

fun! ansible#check()
	if ( ft#contains('ansible') && executable('ansible-lint'))
		let exe = "!ansible-lint " . expand("%:p")
		exec exe
	else
		echo "this function can only be executed on ansible filetype"
	endif
endfunction


