" Lookup the country for an IP address under the current cursor
"
" Make sure Python is ready
if !has("python3")
	echo "vim has to be compiled with +python3 to run the iptrace package"
	finish
endif

python3 << endpython
import vim, re, subprocess
from requests import get

def getInfoOfIP( ip ):
	#use the minimal http://www.hostip.info/use.html API
	r = get('http://api.hostip.info/get_html.php?ip='+ip)
	return r.text

def getIPUnderCursor():
	txt = vim.eval("expand('<cWORD>')")
	regex = r"((?'ip4'(\d{1,3}\.){3}\d{1,3})|(?'ip6'(([0-9a-f]{1,4})?:){7}[0-9a-f]{4}?))"
	if re.match(regex,txt) is not None:
 		return txt
	else:
	 	return None
		

def lookupIPUnderCursor():
	ip = getIPUnderCursor()
	if ip is None:
		print('word under cursor is not a valid ip4/ip6 address')
	else:
		print('Looking up ' + ip + '...')
		result = getInfoOfIP( ip )
		vim.command( "redraw" ) # discard previous messages
		print(result)

def traceIPRoute():
	ip = getIPUnderCursor()
	if ip is None:
		print('word under cursor is not a valid ip4/ip6 address')
	else:
		print('Tracing ' + ip + '...')
		result = subprocess.call('traceroute '+ ip, shell=True)
		vim.command( "redraw" ) # discard previous messages
		print(result)

endpython

fun! iptrace#Info()
	exec "python3 lookupIPUnderCursor()"
endfunctio
" return a trace route of the ip under the cursor 8.8.8.8
fun! iptrace#Trace()
	exec "python3 traceIPRoute()"
endfunction
