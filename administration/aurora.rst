.. index:: Aurora

Aurora
======

Aurora is a lightweight endpoint agent with the following capabilities:

- runs on Windows endpoints
- applies Sigma rules and IOCs to local event streams
- uses Event Tracing for Windows (ETW) to subscribe to certain pre-configured event channels
- extends the Sigma standard with "response actions" that can execute after a rule matches
- supports multiple output channels: the Windows Event Log, a log file, and remote syslog.

The Aurora documentation is available at
`aurora-agent-manual.nextron-systems.com <https://aurora-agent-manual.nextron-systems.com>`_.

Aurora Overview
~~~~~~~~~~~~~~~
The view at ``Service Control`` > ``Aurora`` > ``Asset View (Deployed)``
shows all assets with Aurora installed. Clicking an entry opens a drop-down
menu with details and additional information.

.. figure:: ../images/mc_aurora-view-deployed.png
   :alt: Aurora Asset View

   Aurora Asset View

Deploy Aurora on Asset
~~~~~~~~~~~~~~~~~~~~~~

You can see an overview of all assets without Aurora installed under
``Service Control`` > ``Aurora`` > ``Asset View (Not Deployed)`` and install
Aurora using the ``Deploy Aurora`` button. These assets have the service
controller installed, but Aurora has not been deployed yet.

Change Service for an Asset
~~~~~~~~~~~~~~~~~~~~~~~~~~~

To change the Aurora configuration of an asset, navigate to ``Service Control``
> ``Aurora`` > ``Asset View (Deployed)``, select the asset's checkbox, and
choose ``Change Aurora Configuration``. Then choose the desired service
configuration by clicking ``Assign and Restart``.

.. figure:: ../images/mc_aurora-assign-config.png
   :alt: Change Aurora Service Configuration

   Change Aurora Service Configuration

To enable or disable the Aurora service on one or more assets, select them
with the checkbox and use the ``Enable`` or ``Disable`` button. Alternatively,
use the play or stop action icon on a single asset to
achieve the same.

Create a Custom Aurora Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Go to ``Service Control`` > ``Aurora`` > ``Configurations`` > ``Add Configuration``,
enter a name and add the rulesets that should apply for this service configuration.
Using no rulesets is a valid option if you only want to use the non-Sigma
matching modules. You do not need to edit any other option because the default
settings are suitable for typical deployments.

.. figure:: ../images/mc_add-custom-aurora-config.png
   :alt: Create a Custom Aurora Configuration

   Create a Custom Aurora Configuration

Process Excludes
~~~~~~~~~~~~~~~~~~

If Aurora uses too many CPU cycles, the most common reason is a high-volume
event producer on the system, such as antivirus or communication software. To
analyze the issue and define process exclusions, go to ``Service Control`` >
``Aurora`` > ``Process Exclusions``

.. figure:: ../images/mc_aurora-process-exclusions.png
   :alt: Define Aurora Process Exclusion

   Define Aurora Process Exclusion

An overview of the top event-producing processes is shown at the bottom
of the section. You can also download an
:ref:`troubleshooting/agent-debugging:aurora diagnostics pack`
and review the event statistics by process in ``status.txt``.

False Positive Filters
~~~~~~~~~~~~~~~~~~~~~~
If needed, false positives can be globally defined on all Aurora agents
at ``Service Control`` > ``Aurora`` > ``False Positive Filters``. It is
recommended to filter false positives at ``Service Control`` > ``Sigma`` >
``Rules`` and tune false positives at the rule level using the "edit false
positive" action (funnel icon). For more details, see
:ref:`administration/sigma:false positive tuning of sigma rules`. If this is
not possible, because you need a quick fix and multiple rules are affected,
the global false positive filter can help.

.. figure:: ../images/mc_aurora_fps.png
   :alt: Define Global Aurora False Positive Filters

   Define Global Aurora False Positive Filters

.. warning::
   An overly permissive filter will greatly reduce Aurora's detection
   and response capabilities.

Response Action Logs
~~~~~~~~~~~~~~~~~~~~
You can view an overview and the logs of the Aurora response and simulated
response actions under ``Service Control`` > ``Aurora`` > ``Response Action Logs``.

.. figure:: ../images/mc_aurora-response-action-logs.png
   :alt: Aurora Response Action Logs

   Aurora Response Action Logs

Best Practices for Managing Aurora
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Install the ASGARD Agent on the asset (see :ref:`administration/agent:asgard agent deployment`).
2. Deploy the Aurora service on the asset using the ``[Default] Standard configuration with critical and high Sigma rules`` configuration (see :ref:`administration/aurora:deploy aurora on asset`).

.. figure:: ../images/mc_aurora-best-practices.png
   :alt: Aurora Service Successfully Deployed

   Aurora Service Successfully Deployed

If you want to enable the blocking capabilities of Aurora, enable the
included responses:

1. See the overview at ``Service Control`` > ``Aurora`` > ``Configurations``.
   The ``Effective Rules and Response`` row shows how many responses are active.
   By default, no responses are active. See :ref:`administration/sigma:how to activate responses`.
2. Do not directly activate the responses in production environments. Monitor
   your environment for at least a month with simulated responses to verify
   that no false positive matches occur.
3. In larger environments, use different configurations and rulesets for
   different environments. For example, test configuration changes in a test
   environment before applying them to the production environment.

You can test the response functionality by entering the command

.. code-block:: doscon

   C:\Users\user>rundll32.exe AuroraFunctionTest.dll StartW

on the command line of an asset. As a result, you should see the following
message in the ``Service Control`` > ``Aurora`` > ``Response Action Logs``:

.. figure:: ../images/mc_aurora-example-response.png
   :alt: Aurora Service Successfully Deployed

   Aurora Simulated Response Action 

More tests are available from the
`Function Tests section of the Aurora manual <https://aurora-agent-manual.nextron-systems.com/en/latest/usage/function-tests.html>`_.
Those tests only generate detection events, not responses. If your ASGARD
Management Center is connected to an Analysis Cockpit, you can see the
detection events at ``Events`` > ``Aurora Events`` or in the Windows Event Log
of the asset.
