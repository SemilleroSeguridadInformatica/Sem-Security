.. _nebula14:

.. role:: bash(code)
	  :language: bash

.. role:: python(code)
	  :language: python
	       
Nebula level 14
===============

Basic information
-----------------

**Home Page:** https://exploit-exercises.com/nebula/level00/

**No source code given**

Solution
--------

Create a python script with the following code

.. code-block:: python

		import sys


		def decrypt(data):
		    ret = []
		    for pos, i in enumerate(data):
		        a = ord(i)
			a -= pos
			ret.append(chr(a))

		    return "".join(ret)


		if __name__ == "__main__":
		    print(decrypt(sys.argv[1]))

Then run it

:bash:`cat /home/flag14/token | xargs python decrypt_14.py`
