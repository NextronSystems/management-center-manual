.. index:: Disable Remote Console Globally

Disable Remote Console Globally
===============================

Remote Console can be disabled centrally on connected endpoints by creating
the following file:

.. code-block:: console

   nextron@mc:~$ sudo touch /etc/asgard-management-center/disable_console

To re-enable Remote Console, remove the created file:

.. code-block:: console

   nextron@mc:~$ sudo rm /etc/asgard-management-center/disable_console
