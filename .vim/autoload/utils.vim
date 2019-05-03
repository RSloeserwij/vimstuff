
fun! utils#Execute()
	let executable=s:GetHeader()
	if executable == 0
		let exe= "w !" . executable
		exec exe
	else
		if (&filetype!='' && &filetype!='text')
			let exe = "w !" . &filetype
			exec exe			
		else
			echom "This file does not contain an executable header or has an executeable filetype"
		endif
	endif
endfunction


fun! s:GetHeader()
	if strpart(getline(1),0,2) == "#!"
		return substitute(getline(1), '#!', "", "")
	else
		return 1		
	endif
endfunction


			
