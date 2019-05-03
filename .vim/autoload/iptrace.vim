" Lookup the country for an IP address under the current cursor
"
" Make sure Python is ready
if !has("python3")
	echo "vim has to be compiled with +python3 to run the iptrace package"
	finish
endif

python3 << endpython
import vim
from requests import get

def getInfoOfIP( ip ):
	#use the minimal http://www.hostip.info/use.html API
	r = get('http://api.hostip.info/get_html.php?ip='+ip)
	return r.text

def getWordUnderCursor():
	return vim.eval("expand('<cWORD>')")

def lookupIPUnderCursor():
	ip = getWordUnderCursor()
	print('Looking up ' + ip + '...')
	result = getInfoOfIP( ip )
	vim.command( "redraw" ) # discard previous messages
	print(result)

endpython

fun! iptrace#getInfo()
	exec "python3 lookupIPUnderCursor()"
endfunction
