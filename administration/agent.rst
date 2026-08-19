.. index:: Endpoint Agent Deployment

Endpoint Agent Deployment
-------------------------

There are currently two modes of operation for the Endpoint Agent:

- **Normal** - This is the default mode and allows usage of all
  Management Center features.
- **Essential** - This is a lightweight mode that only allows THOR scanning
  and Aurora deployment.

The Agent in Essential Mode uses a separate installer and
needs to be created in the :ref:`advanced/custom-agent:creating custom agent installers`.

To connect a new endpoint to Management Center, download and install
the Endpoint Agent on the system you want to onboard.

The Endpoint Agent can be directly downloaded from the Management Center
login screen through the button ``Download Agent Installers``. A list
of available agents for various operating systems appears. 

.. hint::
   You can disable agent downloads on the login screen. See
   :ref:`administration/advanced:advanced settings`.

.. figure:: ../images/mc_login-screen.png
   :alt: Download Agent Installers from Login Screen

   Download Agent Installers from Login Screen

.. figure:: ../images/mc_agents-overview.png
   :alt: Agents Overview

   Agents Overview

After the installation, the endpoints will connect to your Management
Center, register automatically, and appear in the Asset Management section
on the ``Asset Requests`` tab. Allow two or three minutes for systems to
appear. The agents use the FQDN to connect to your Management Center, so
make sure your endpoints can resolve and reach the Management Center by FQDN.

.. note::
   Full administrative privileges are required for the Endpoint Agent
   and THOR to operate properly.

On the requests tab, select the agents you want your Management Center to
manage and click ``Accept Asset Requests``. The endpoint then appears in
the assets overview and is ready to be managed and scanned.

.. figure:: ../images/mc_accept-asset-request.png
   :alt: Accepting Endpoint Agent Requests

   Accepting Endpoint Agent Requests

Windows Agent Deployment
^^^^^^^^^^^^^^^^^^^^^^^^

Because the Windows Agent Installer is an ``.exe`` file and not an
``.msi`` file, you need to use custom scripts to deploy the agent through
your management system of choice. We provide an example PowerShell script
that should work with most tools. See
:ref:`appendix/scripts:installing endpoint agent via powershell script` and
:ref:`appendix/scripts:deploy endpoint agents via sccm`.

Alternatively, if you want to deploy the Endpoint Agent manually, you can
run the installer manually.

Linux Agent Deployment
^^^^^^^^^^^^^^^^^^^^^^

To deploy the Endpoint Agent on a Linux system, use the following
commands:

.. code-block:: console
   :caption: Debian based systems

   user@unix:~/Downloads$ sudo dpkg -i asgard2-agent-linux-amd64.deb

.. code-block:: console
   :caption: RHEL, CentOS and Fedora

   user@unix:~/Downloads$ sudo rpm -i asgard2-agent-linux-amd64.rpm

You can deploy agents with most common Linux tools. Make sure the installer
runs with administrative privileges.

macOS Agent Deployment
^^^^^^^^^^^^^^^^^^^^^^

To install the agent on macOS, run the PKG file or execute the following
command in Terminal:

.. code-block:: console
   
     MacBook-Pro:~ nextron$ sudo installer -pkg /Users/nextron/Downloads/asgard2-agent-macos-arm64.pkg -target /

Starting with macOS Big Sur (v11.0), Apple requires software developers
to notarize applications. Our ``asgard2-agent`` installer is notarized.

You can verify the signature by executing the following command in Terminal:

.. code-block:: console
   
   MacBook-Pro:~ nextron$ pkgutil --check-signature /Users/nextron/Downloads/asgard2-agent-macos-arm64.pkg
   Package "asgard2-agent-macos-arm64.pkg":
   Status: signed by a developer certificate issued by Apple for distribution
   Notarization: trusted by the Apple notary service
   Signed with a trusted timestamp on: XXXX-XX-XX XX:XX:XX +0000
   ...

If you encounter installation issues, see
:ref:`appendix/gatekeeper:Bypass Apple verification during installation of asgard2-agent`.

macOS Full Disk Access
~~~~~~~~~~~~~~~~~~~~~~

Since macOS Ventura (v13.0), the Endpoint Agent needs Full Disk Access
to function properly. After you have deployed the Endpoint Agent, you need
to grant the service the required access permissions. Administrative
privileges on the machine are required to perform the
following tasks.

.. note:: 
   There is no workaround for these steps because they are part of the
   security design of Apple devices. If you have trouble with THOR scans
   via the Management Center on macOS, check whether the
   ``Full Disk Access`` permission for the Endpoint Agent was granted.
   Since macOS Mojave (v10.14), you also need to grant the same
   permissions to removable volumes if you plan to scan them.

If you need to grant Full Disk Access via MDM, see
:ref:`appendix/mdm-fulldiskaccess:Full Disk Access for macOS asgard2-agent-service via MDM`.

To grant access manually, navigate on your Mac to ``System Settings`` >
``Privacy & Security`` > ``Full Disk Access``:

.. figure:: ../images/macos_privacy_and_security.png
   :scale: 36
   :alt: macOS 13 Privacy & Security

Enable the ``asgard2-agent-service`` slider:

.. figure:: ../images/macos_full_disk_access.png
   :scale: 40
   :alt: macOS 13 Full Disk Access

.. note::
   In macOS Tahoe 26 versions earlier than 26.3, macOS may not display the
   ``asgard2-agent-service`` entry in the Full Disk Access UI. This is fixed
   in macOS Tahoe 26.3.
