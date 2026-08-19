.. index:: Golden Image

Installing Endpoint Agent on a Golden Image
===========================================

If you want to include the Endpoint Agent in your Golden Image, follow the
steps in this section. Make sure to download the correct Agent Installer
package from your Management Center.

You have two options for deploying an agent on your Golden Image. The first
option is the easier method.

Offline Installation
^^^^^^^^^^^^^^^^^^^^

.. note::
   Before continuing, make sure the host cannot reach your Management Center.

In this method, make sure that the host system being prepared for the Golden
Image is either offline or cannot reach the Management Center. Install the
Endpoint Agent as usual. Once the installation is complete, stop the
``asgard2-agent`` service.

Windows (administrative command prompt):

.. code-block:: doscon

   C:\Windows\system32>sc stop asgard2-agent

Linux:

.. code-block:: console

   user@golden:~$ sudo systemctl stop asgard2-agent.service

Your Endpoint Agent should be ready now. Make sure that the agent does not
communicate with the Management Center during the process. If the agent
communicates with the Management Center and creates an Asset Request,
stop the ``asgard2-agent`` service again
and inspect the following file:

* Windows: ``C:\Windows\System32\asgard2-agent\asgard2-agent.yaml``
* Linux: ``/var/lib/asgard2-agent/asgard2-agent.yaml``

The file should not contain the marked lines in the next example. If both lines
exist, delete them and save the file. Also deny the Asset Request in the
Management Center to
avoid confusion:

.. code-block:: yaml
   :linenos:
   :emphasize-lines: 2-3

   host: yourmc.domain.local:443
   token: +uW6HrF3kxmLNZYqKTKuZt [...]
   registered: true
   proxy: []
   system_proxy: false
   labels: []
   write_log: false

.. warning::
   Your Golden Image will not work if the two lines in the ``asgard2-agent.yaml``
   file exist. It will create a ``Duplicate Asset`` instead. Make sure that
   these lines are not present when you create the Golden Image.

Online Installation
^^^^^^^^^^^^^^^^^^^

If you cannot prevent the host being used for the Golden Image from
communicating with the Management Center, follow these steps. Install the
Endpoint Agent as usual. Once the installation is complete, stop the
``asgard2-agent`` service.

Windows (administrative command prompt):

.. code-block:: doscon

   C:\Windows\system32>sc stop asgard2-agent

Linux:

.. code-block:: console

   user@golden:~$ sudo systemctl stop asgard2-agent.service

Once the service is stopped, edit the agent configuration file. This is
necessary because the agent has already communicated with the Management
Center and generated
a ``token``, which should be unique. If you create the Golden Image now, the
systems installed from that image will appear as ``Duplicate Asset`` (see
:ref:`troubleshooting/agent-debugging:duplicate assets remediation`).

Open the ``asgard2-agent.yaml`` file and delete the marked lines in this example.

* Windows: ``C:\Windows\System32\asgard2-agent\asgard2-agent.yaml``
* Linux: ``/var/lib/asgard2-agent/asgard2-agent.yaml``

.. code-block:: yaml
   :linenos:
   :emphasize-lines: 2-3

   host: yourmc.domain.local:443
   token: +uW6HrF3kxmLNZYqKTKuZt [...]
   registered: true
   proxy: []
   system_proxy: false
   labels: []
   write_log: false

After you delete the two lines and save the file, your host is ready. Make
sure those two lines are not present and the ``asgard2-agent`` service is still
not running. Delete the ``token`` because it is unique to the Management
Center. If two agents
present the same token, they will be flagged as duplicate assets. The
``registered`` value tells the agent whether it has to send a new asset
request. Once it is set to ``true``, it will not send a new request.

.. hint::
   Deny the Asset Request that was created while installing the agent on the
   host in the Management Center. This avoids confusion later.
