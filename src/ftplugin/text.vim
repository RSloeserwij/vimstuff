
function! SetSyntaxWindow(filetype, initializing)
	let a:ft=toupper(a:filetype)
	let a:group='@'.toupper(a:ft)

	if exists('b:current_syntax')
		let s:current_syntax=b:current_syntax
		unlet b:current_syntax
	endif

	execute 'syntax include '.a:group.' syntax/'.a:filetype.'.vim'
	try
		execute 'syntax include '.a:group.' syntax/after/'.a:filetype.'.vim'
	catch
	endtry

	if exists('s:current_syntax')
		let b:current_syntax=s:current_syntax
	else
		unlet b:current_syntax
	endif
	
	let a:start='@begin='.a:filetype.'@'
	let a:end='@end='.a:filetype.'@'

	execute 'syntax region '.a:filetype.'Snip matchgroup=Snip keepend start="'.a:start.'" end="'.a:end.'" contains='.a:group
	execute 'hi link Snip SpecialComment'
endfunction

function! Check_file_for_syntax_blocks()
	" get buffer into var
	let a:buf = join(getline(1,'$'),"\n")
	" check if any patterns exist
	if matchstr(a:buf,'@begin') == ""
		return ""
	endif
	"remove text between start and first pattern
	let a:buf = substitute(a:buf,'^[^@]*@begin','@begin','')
	"remove text after last @end node
	let a:buf = substitute(a:buf,'\(@end=[^@]*@\)[^@]*$','\=submatch(1)','')
	"remove text in between nodes
	let a:buf = substitute(a:buf,'\(@end=[^@]*@\)[^@]*\(@begin=[^@]*@\)', '\=submatch(1)."\n".submatch(2)', 'g')

	"reduce to a list of syntax names
	let a:buf = substitute(a:buf,'@begin=\([^\n]*\)@[^@]*@end=\1@','\=submatch(1)',"g")

	"remove duplicates
	let a:fts_raw = sort(split(a:buf,"\n"))
	let a:fts = filter(copy(a:fts_raw), 'index(a:fts_raw, v:val, v:key+1) == -1')

	"create a syntax window for each entry in a:fts
	for a:syn in a:fts
		call SetSyntaxWindow(a:syn,1)
	endfor

	echom "created syntaxblocks for [".join(a:fts,",")."]"
endfunction

au VimEnter *.txt call Check_file_for_syntax_blocks()
