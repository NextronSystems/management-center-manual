.. Index:: Install Service

Install the Management Center Service
-------------------------------------

The Nextron Universal Installer is a web-based installer
that guides you through the installation of Nextron products.
The Nextron Universal Installer installs
**one** of the following products on your server (this manual
focuses on the ``Management Center``):

.. hint::

   If you want to install Master Management Center, use the correct
   license and product (``Master Management Center``)
   in the Nextron Universal Installer.

- Management Center; alternatively if your license permits:
  
  * Broker
  * Gatekeeper
  * Lobby

- Master Management Center

- Analysis Cockpit; alternatively:
  
  * Elasticsearch Cluster Node for Analysis Cockpit

- Security Center, in the following variants:

  * Security Center (Backend Only)
  * Security Center (Frontend Only)
  * Security Center (All-in-one, unrecommended)

.. note::
   You can only install one product on one server because the
   products are not designed to coexist on the same server.
   The exception is Security Center (All-in-one).

The installation takes roughly 5 to 15 minutes, depending
on your Internet connection and the server on which you install
the product.

If you encounter problems during installation, see
:ref:`setup/components:diagnostic pack` for further instructions.

Requirements
~~~~~~~~~~~~

The Management Center installation requires the following:

- A valid license file for the Management Center
- A configured FQDN (with some exceptions, see :ref:`setup/components:valid fqdn`)
- Internet access during installation (see :ref:`setup/components:connectivity check`)

Installation
~~~~~~~~~~~~

After the ISO installer finishes the setup, the console login prompt shows
the following message:

.. figure:: ../images/setup_nextronInstaller.png
   :alt: Login prompt Management Center

Follow the instructions and open the web page displayed on your console.
Your browser will likely show a warning the first time you connect to the
page. The page uses a self-signed certificate because it is only used to
install Management Center. You can ignore this warning and proceed
to the page.

The Nextron Universal Installer first shows a short introduction. After
you click ``Next``, the landing page of the Nextron Universal Installer
opens.

.. figure:: ../images/setup_nextronInstaller-landing.png
   :alt: landing page of the Universal Installer

Enter the installation code from the terminal and click
``Next``. The installer then guides you through the
installation.

Connectivity Check
~~~~~~~~~~~~~~~~~~

The Nextron Universal Installer tries to connect to our
update server to download all required packages
when the installation starts. Make sure you can reach the
update servers (see :ref:`requirements/network:internet access during installation`).

Configure your proxy settings if you are behind a
proxy (see :ref:`setup/components:proxy and ntp settings`).

Valid FQDN
~~~~~~~~~~

The Nextron Universal Installer prompts you to verify the
FQDN that you configured during the base system installation
(see :ref:`setup/network:network configuration`). This is required
so Endpoint Agents can communicate with Management Center over
HTTPS. Agents use the FQDN to connect to Management Center and
verify the certificate's Common Name. If there is a mismatch, agents
cannot connect to Management Center.

If the displayed FQDN is not correct, you can change it by
clicking the ``View FQDN Change Instructions`` button.
This will open a dialog with instructions on how to change
the FQDN of your server. Once you have changed the FQDN,
you can continue with the installation.

.. figure:: ../images/setup_nextronInstaller-fqdn.png
   :alt: FQDN Verification of the Universal Installer

Proxy and NTP Settings
~~~~~~~~~~~~~~~~~~~~~~

If you need to configure a proxy or change the NTP settings
of your system, click the ``Settings``
button in the left menu of the Nextron Universal Installer.

.. figure:: ../images/setup_nextronInstaller-settings.png
   :alt: Settings of the Universal Installer

If you configured a proxy during the ISO installation, those
settings will be carried over into the Universal Installer.
The settings will also be carried over into Management Center.
The same applies to NTP.

Diagnostic Pack
~~~~~~~~~~~~~~~

If errors or problems occur during installation, you can download a
diagnostic pack from the ``Diagnostics`` tab in the left menu of the
Nextron Universal Installer. Click ``Download Diagnostic Pack`` to
download the diagnostic pack. You can then send it to our support team
for further analysis.

.. figure:: ../images/setup_nextronInstaller-diagnostics.png
   :alt: Diagnostics of the Universal Installer
