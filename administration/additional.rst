.. index:: Additional Settings

Additional Settings
===================

Rsyslog Forwarding
^^^^^^^^^^^^^^^^^^

Rsyslog forwarding can be configured in ``Settings`` > ``System`` >
``Rsyslog``. To add a forwarding configuration for local log
sources, click ``Add Rsyslog Forwarding``.

.. figure:: ../images/mc_rsyslog-forwarder.png
   :alt: Rsyslog Forwarding

The following log sources can be forwarded individually:

.. list-table:: Available Log Sources 
   :header-rows: 1
   :widths: 25, 75

   * - Log
     - Description
   * - Management Center Log
     - Everything related to the Management Center service, processes, tasks, and scan jobs
   * - Management Center Audit Log
     - Detailed audit log of all user activity within the system
   * - Agent Log
     - All Endpoint Agent activities
   * - THOR Log
     - THOR scan results
   * - THOR Log (Realtime)
     - THOR scan results [1]_
   * - Aurora Log
     - Aurora logs

.. [1] ``The THOR (Realtime)`` logs are the same logs as THOR logs,
       except that they are collected via UDP syslog instead of
       HTTPS. To forward THOR logs in real time, you must
       configure your scans to forward syslog to the Management
       Center, see :ref:`administration/syslog:syslog forwarding`.
       Make sure the necessary firewall rules are in place to allow
       the asset to communicate with the Management Center.

TLS Certificate Installation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Instead of using the preinstalled self-signed TLS certificate,
users can upload their own TLS certificate for the Management Center.

.. figure:: ../images/mc_generate-csr.png
   :alt: Generate a Certificate Signing Request (CSR)

   Generate a Certificate Signing Request (CSR)

To achieve the best possible compatibility with the
most common browsers, we recommend using the system's FQDN
in both fields ``Common Name`` AND ``Hostnames``.

Generating a CSR on the command line is not supported.

The generated CSR can be used to generate a TLS certificate.
You can then upload this TLS certificate in the ``Settings`` > ``TLS`` section.

.. figure:: ../images/mc_upload-tls-cert.png
   :alt: Upload a TLS Certificate

   Upload a TLS Certificate

Manage Services
^^^^^^^^^^^^^^^

The individual Management Center services can be managed in ``Settings`` >
``System`` > ``Services``. The services can be stopped or restarted
with the corresponding buttons in the ``Actions`` column.

.. figure:: ../images/mc_manage-services.png
   :alt: Configuration of Services

   Manage Services

NTP Configuration
^^^^^^^^^^^^^^^^^

The current NTP configuration can be found in ``Settings`` >
``System`` > ``NTP``.

.. figure:: ../images/mc_ntp.png
   :alt: NTP Configuration

   NTP configuration

You can add or delete NTP servers by adding/changing the values
in the text fields. After you finish your changes, click
``Save and Restart NTP`` to save your changes.

Link Analysis Cockpit
^^^^^^^^^^^^^^^^^^^^^

To connect to an Analysis Cockpit, enter the
respective hostname of the Analysis Cockpit (use the same
FQDN used during installation of the Analysis Cockpit) in
the field ``FQDN``, enter the one-time code, choose the
type, and click ``Update Analysis Cockpit``.

.. figure:: ../images/mc_link-cockpit.png
   :alt: Linking the Analysis Cockpit

   Linking the Analysis Cockpit 

The Cockpit's API key can be found at ``Settings`` >
``Link Products`` > ``Management Center``.

.. figure:: ../images/mc_ac-settings.png
   :alt: Analysis Cockpit API Key

   Analysis Cockpit API Key

The Management Center must be able to connect to the Analysis Cockpit
on port 7443/TCP for a successful integration. Once connected,
the Cockpit will appear in the Management Center's ``System Status`` > ``Overview``
section with the other connectivity tests.

Please wait up to five minutes for the status to change on the
Management Center's system status page. It changes from ``Not linked`` to ``Online``.

.. figure:: ../images/mc_connectivity-test.png
   :alt: Connectivity Test

   Connectivity Test

Link Master Management Center
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To control your Management Center with a Master Management
Center, generate a one-time code and use it in the "Add Management
Center" dialog within the Master Management Center frontend.


.. figure:: ../images/mc_link-master.png
   :alt: Link Master Management Center

   Link Master Management Center

See :ref:`master-mc/master-mc:link management centers with master management center`
for more information.

Link MISP
^^^^^^^^^

To connect to a MISP with your Management Center,
navigate to ``Settings`` > ``MISP``. Insert the MISP's address,
enter the API key, and click ``Test and Link MISP``.

.. figure:: ../images/mc_link-misp.png
   :alt: Link MISP

   Link MISP

The MISP connectivity status is shown in the ``Overview`` section.
Please allow five minutes for the connection status to indicate the
correct status and for MISP rules to be downloaded and shown in
``IOC Management`` > ``MISP`` > ``MISP Events``.

.. figure:: ../images/mc_connectivity-test.png
   :alt: MISP connectivity status

   MISP connectivity status

Change Proxy Settings
^^^^^^^^^^^^^^^^^^^^^

In this dialog, you can add or modify the proxy
configuration. You need to restart the service
afterwards from the ``Services`` tab.

.. figure:: ../images/mc_proxy-setup.png
   :alt: Change Proxy Settings

   Change Proxy Settings
