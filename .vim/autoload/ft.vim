let $VIMHOME= $HOME."/.vim"

function! ft#has_single()
	if (&filetype =~ "\.")
		return 0
	elseif (&filetype == "")
		return 0
	else
		return 1
	endif
endfunction


function! ft#has_multiple()
	if (&filetype =~ "\.")
		return 1
	else
		return 0
	endif
endfunction

function! ft#contains(query)
	if ( ft#has_multiple() )
		let a:fts = split(&filetype,'\.')
		let a:result = index(a:fts,a:query)
		return (a:result != -1)
	else
		return (&filetype == a:query)
	endif
endfunction

function! ft#has_plugin(...)
	let a:ft = get(a:, 1, &filetype)
	return filereadable($VIMHOME."/ftplugin/".a:ft.".vim")
endfunction

