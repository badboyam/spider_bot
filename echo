1	
2	local function run(msg, matches)
3	  local text = matches[1]
4	  local b = 1
5	
6	  while b ~= 0 do
7	    text = text:trim()
8	    text,b = text:gsub('^!+','')
9	  end
10	  return text
11	end
12	
13	return {
14	  description = "Simplest plugin ever!",
15	  usage = "!echo [whatever]: echoes the msg",
16	  patterns = {
17	    "^!echo +(.+)$"
18	  }, 
19	  run = run 
20	}
