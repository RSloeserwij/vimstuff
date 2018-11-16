
fun! utils#Execute()
	let executable=utils#GetHeader()
	if executable == 0
		let exe= "w !" . executable
		exec exe
	else
		echom "This file does not contain an executable header"
	endif
endfunction


fun! utils#GetHeader()
	if strpart(getline(1),0,2) == "#!"
		return substitute(getline(1), '#!', "", "")
	else
		return 1		
	endif
endfunction


			
