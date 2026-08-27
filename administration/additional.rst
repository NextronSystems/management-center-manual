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
     - Everything related to the Management Center service, processes, task and scan jobs
   * - Management Center Audit Log
     - Detailed audit log of all user activity within the system
   * - Agent Log
     - All Endpoint Agent activities
   * - THOR Log
     - THOR scan results
   * - THOR Log (Realtime)
     - THOR scan results [1]_
   * - Aurora Log
     - Aurora Logs

.. [1] ``The THOR (Realtime)`` logs are the same logs as THOR logs,
       except that they are collected via udp syslog instead of
       https. To forward THOR logs in realtime, you have to
       configure your scans to forward syslog to the Management Center,
       see
       :ref:`administration/syslog:syslog forwarding`. Make
       sure the necessary firewall rules are in place to allow
       the asset to communicate with the Management Center.

TLS Certificate Installation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Instead of using the pre-installed self-signed TLS Certificate,
users can upload their own TLS Certificate for the Management Center.

.. figure:: ../images/mc_generate-csr.png
   :alt: Generate a Certificate Signing Request (CSR)

   Generate a Certificate Signing Request (CSR)

In order to achieve the best possible compatibility with the
most common browsers, we recommend using the system's FQDN
in both fields ``Common Name`` AND ``Hostnames``.

Please note that generating a CSR on the command line is not supported.   

The generated CSR can be used to generate a TLS Certificate.
Subsequently, this TLS Certificate can be uploaded in the ``Settings`` > ``TLS`` section.

.. figure:: ../images/mc_upload-tls-cert.png
   :alt: Upload a TLS Certificate

   Upload a TLS Certificate

.. note:: 
   Please see
   :ref:`appendix/tls:install tls certificates on management center and master management center`
   for a guide on how to sign the CSR and install it in your Management
   Center.

Manage Services
^^^^^^^^^^^^^^^

The individual Management Center services can be managed in ``Settings`` >
``System`` > ``Services``. The services can be stopped or restarted
with the respective buttons in the ``Actions`` column. 

.. figure:: ../images/mc_manage-services.png
   :alt: Configuration of Services

   Manage Services

NTP Configuration
^^^^^^^^^^^^^^^^^

The current NTP configuration can be found ``Settings`` >
``System`` > ``NTP``.

.. figure:: ../images/mc_ntp.png
   :alt: NTP Configuration

   NTP configuration

You can add or delete NTP servers by adding/changing the values
in the text fields. After you are done with your changes, click
``Save and Restart NTP`` to save your changes.

Settings for Bifrost
^^^^^^^^^^^^^^^^^^^^

Bifrost allows you to automatically upload suspicious files to your
Management Center during a THOR scan. If an Analysis Cockpit is connected,
these files get automatically forwarded to the Analysis Cockpit
in order to drop them into a connected Sandbox system. However,
the collected files will stay on the Management Center for the amount of time
specified in ``Retention time`` (0 days represent an indefinite amount of time). 

.. figure:: ../images/mc_bifrost-settings.png
   :alt: Settings for Bifrost

   Settings for Bifrost

The collected files can be downloaded in the ``Evidence Collection``
section. All files are zip archived and password protected with the password ``infected``.

In order to automatically collect suspicious files, you have to
create a scan with Bifrost enabled. Check the
``Send Suspicious Files to Management Center``
option to send samples to the system set as ``bifrost2Server``. Use the placeholder 
``%asgard-host%`` to use the hostname of you Management Center instance as the Bifrost server.

.. figure:: ../images/mc_thor-bifrost-flag.png
   :alt: Bifrost Options

   Scan option for Bifrost 

This will collect all files with a score of 60 or higher and make
them available for download in Management Centers ``Collected Files`` section.

For Details on how to automatically forward to a sandbox system please
refer to the `Analysis Cockpit Manual <https://analysis-cockpit-manual.nextron-systems.com/>`_ .

Link Analysis Cockpit
^^^^^^^^^^^^^^^^^^^^^

In order to connect to an Analysis Cockpit, enter the
respective hostname of the Analysis Cockpit (use the same
FQDN used during installation of the Analysis Cockpit) in
the field ``FQDN``, enter the one-time code, choose the
type and click ``Update Analysis Cockpit``. 

.. figure:: ../images/mc_link-cockpit.png
   :alt: Linking the Analysis Cockpit

   Linking the Analysis Cockpit 

The Cockpit's API key can be found at ``Settings`` >
``Link Products`` > ``Management Center``.

.. figure:: ../images/mc_ac-settings.png
   :alt: Analysis Cockpit API Key

   Analysis Cockpit API Key

The Management Center must be able to connect to the Analysis Cockpit
on port 443/TCP for a successful integration. Once connected,
the Cockpit will show up in Management Centers ``System Status`` > ``Overview``
section together with the other connectivity tests. 

Please wait up to five minutes for the status to
change on the Management Center's system status page. It will change
from ``Not linked`` to ``Online``.

.. figure:: ../images/mc_connectivity-test.png
   :alt: Connectivity Test

   Connectivity Test

Link Master Management Center
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In order to control your Management Center with a Master Management
Center, you must generate a One-Time Code and use it in the
"Add Management Center" dialogue within the Master Management Center
frontend.


.. figure:: ../images/mc_link-master.png
   :alt: Link Master Management Center

   Link Master Management Center

Please see :ref:`master-mc/master-mc:link management centers with master management center`
for more information.

Link MISP
^^^^^^^^^

In order to connect to a MISP with your Management Center,
navigate to ``Settings`` > ``MISP``. Insert the MISP's address,
along with the API Key and click ``Test and Link MISP``.

.. figure:: ../images/mc_link-misp.png
   :alt: Linking a MISP to the Management Center

   Linking a MISP to the Management Center

The MISP connectivity status is shown in the ``Overview`` section.
Please allow five minutes for the connection status to indicate the
correct status, and also MISP rules to be downloaded and shown in
``IOC Management`` > ``MISP`` > ``MISP Events``.

.. figure:: ../images/mc_connectivity-test.png
   :alt: MISP connectivity status

   MISP connectivity status

Change Proxy Settings
^^^^^^^^^^^^^^^^^^^^^

In this dialogue, you can add or modify the Management Center's proxy
configuration. Please note, you need to restart the Management Center
service (Tab ``Services``) afterwards.

.. figure:: ../images/mc_proxy-setup.png
   :alt: Change Proxy Settings

   Change Proxy Settings
