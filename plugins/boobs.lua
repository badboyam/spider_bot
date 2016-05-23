1	do
2	
3	-- Recursive function
4	local function getRandomButts(attempt)
5	  attempt = attempt or 0
6	  attempt = attempt + 1
7	
8	  local res,status = http.request("http://api.obutts.ru/noise/1")
9	
10	  if status ~= 200 then return nil end
11	  local data = json:decode(res)[1]
12	
13	  -- The OpenBoobs API sometimes returns an empty array
14	  if not data and attempt <= 3 then
15	    print('Cannot get that butts, trying another one...')
16	    return getRandomButts(attempt)
17	  end
18	
19	  return 'http://media.obutts.ru/' .. data.preview
20	end
21	
22	local function getRandomBoobs(attempt)
23	  attempt = attempt or 0
24	  attempt = attempt + 1
25	
26	  local res,status = http.request("http://api.oboobs.ru/noise/1")
27	
28	  if status ~= 200 then return nil end
29	  local data = json:decode(res)[1]
30	
31	  -- The OpenBoobs API sometimes returns an empty array
32	  if not data and attempt < 10 then 
33	    print('Cannot get that boobs, trying another one...')
34	    return getRandomBoobs(attempt)
35	  end
36	
37	  return 'http://media.oboobs.ru/' .. data.preview
38	end
39	
40	local function run(msg, matches)
41	  local url = nil
42	  
43	  if matches[1] == "!boobs" then
44	    url = getRandomBoobs()
45	  end
46	
47	  if matches[1] == "!butts" then
48	    url = getRandomButts()
49	  end
50	
51	  if url ~= nil then
52	    local receiver = get_receiver(msg)
53	    send_photo_from_url(receiver, url)
54	  else
55	    return 'Error getting boobs/butts for you, please try again later.' 
56	  end
57	end
58	
59	return {
60	  description = "Gets a random boobs or butts pic", 
61	  usage = {
62	    "!boobs: Get a boobs NSFW image. ??",
63	    "!butts: Get a butts NSFW image. ??"
64	  },
65	  patterns = {
66	    "^!boobs$",
67	    "^!butts$"
68	  }, 
69	  run = run 
70	}
71	
72	end
