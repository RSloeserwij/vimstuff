
fun! ansible#check()
	if ( ft#contains('ansible') && executable('ansible-lint'))
		let exe = "!ansible-lint " . expand("%:p")
		exec exe
	else
		echo "this function can only be executed on ansible filetype"
	endif
endfunction 
