.. _nebula17:

.. role:: bash(code)
	  :language: bash

.. role:: python(code)
	  :language: python
		     
Nebula level 17
===============

Basic information
-----------------

**Home Page:** https://exploit-exercises.com/nebula/level00/

**Source Code**

.. code-block:: python

		#!/usr/bin/python

		import os
		import pickle
		import time
		import socket
		import signal

		signal.signal(signal.SIGCHLD, signal.SIG_IGN)

		def server(skt):
		    line = skt.recv(1024)

		    print 'Got line: "{}"'.format(line)

		    obj = pickle.loads(line)

		    for i in obj:
		        clnt.send("why did you send me " + i + "?\n")

			skt = socket.socket(socket.AF_INET, socket.SOCK_STREAM, 0)
			skt.bind(('0.0.0.0', 10007))
			skt.listen(10)

			while True:
			    clnt, addr = skt.accept()

			    if(os.fork() == 0):
			        clnt.send("Accepted connection from %s:%d" % (addr[0], addr[1]))
				server(clnt)
				exit(1)

Solution
--------

