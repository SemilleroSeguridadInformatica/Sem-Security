.. _nebula00:

.. role:: bash(code)
    :language: bash

Nebula level 00
===============

Basic information
-----------------

Source: https://exploit-exercises.com/nebula/level00/


execute this on console

.. code-block:: bash

$ find / -perm -4000 -exec ls -ldb {} \; 2>/dev/null | grep "flag00"

