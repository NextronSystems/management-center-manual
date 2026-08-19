.. Index:: Configure the OS

Changing the IP Address
-----------------------

You can change the Management Center's IP address in
``/etc/network/interfaces``. The IP
address is configured with the ``address`` variable.

.. code-block:: console

   nextron@mc:~$ sudoedit /etc/network/interfaces

.. code-block:: none

   auto ens32
   iface ens32 inet static
   address 192.0.2.7
   netmask 255.255.255.0
   gateway 192.0.2.254

The network adapter name can vary. In this example, the adapter is ``ens32``.

Apply the new IP address with the command ``sudo systemctl restart networking``.

Verifying DNS Settings
^^^^^^^^^^^^^^^^^^^^^^

To verify whether the Management Center is using the correct DNS server, inspect
``/etc/resolv.conf``:

.. code-block:: console

   nextron@mc:~$ cat /etc/resolv.conf 
   search example.org
   nameserver 172.16.200.2

If this configuration contains errors, change it with the following command:

.. code-block:: console

   nextron@mc:~$ sudoedit /etc/resolv.conf
