.. index:: IOC Management

IOC Management
==============

The Management Center allows you to create and manage your own IOCs.
These IOCs can be used with THOR and Aurora.

What's the difference between IOCs, IOC Groups, IOC Rulesets, and IOC Files?

- IOCs: Define specific indicators that represent potential threats. Supports different
  types of IOC detection, such as filenames like "some_malware.exe", hashes like "4fef5e34...",
  YARA and Sigma rules, etc.

- IOC Groups: Organize related individual IOCs into manageable groups. For example,
  you can group various individual IOCs related to a "Mimikatz" attack (such as an IOC
  that detects the presence of a file called "mm64c.exe") under a single category.

- IOC Rulesets: IOC Rulesets combine multiple IOC Groups into a comprehensive set of rules.
  With rulesets, you can assemble indicator groups that represent a specific threat
  scenario and apply your changes for streamlined threat detection.

- IOC Files: Upload files containing your own IOCs that you can later use to add them
  to your own IOC Rulesets. See
  `THOR Custom Signatures <https://thor-manual.nextron-systems.com/en/latest/usage/custom-signatures.html>`_ 
  for filename requirements and syntax.

Integrating Custom IOCs
^^^^^^^^^^^^^^^^^^^^^^^

The ``IOC Management`` menu allows you to integrate custom signatures into
your scans.

To create your own custom IOC Group, navigate to ``IOC Management`` > ``IOCs``
and click ``Add IOC`` in the upper-right corner. Select a name and, optionally,
a description for your IOC Group. This opens a dialog that guides you through
IOC creation.

Every IOC has to belong to one IOC Group. One IOC Group can contain multiple IOCs. And finally,
one IOC Ruleset can contain many IOC Groups.

After you finish creating your IOCs, apply the
changes to the IOC Ruleset. You can do this by checking the box toward the end
of the dialog ("Apply changes on all affected rulesets immediately"), or by
setting the IOC Ruleset to "autocompile" (this can also be done during the dialog,
if you create a new IOC Ruleset).

Once you create an IOC Ruleset that contains IOCs, it can be used for scanning with THOR.

.. figure:: ../images/mc_ioc-ruleset-thor-scan.png
   :alt: IOC Ruleset in THOR Scan

   IOC Ruleset in THOR Scan

Anytime you add, remove or change IOCs within one of your IOC Groups,
you must recompile the IOC Ruleset. To do this, navigate to the
``IOC Rulesets`` page and click the "gear" icon (1) in the Ruleset's row.
You can optionally set IOC Rulesets to "Autocompile".

.. figure:: ../images/mc_compile-ioc-ruleset.png
   :alt: Compile IOC Ruleset

   Compile IOC Ruleset

Scan only with Custom IOCs
^^^^^^^^^^^^^^^^^^^^^^^^^^

These rulesets can be selected in the "IOC Rulesets" field while
creating a new scan job. If a ruleset is selected, the scan will
include all custom IOCs included in IOC Groups which have been
added to this ruleset. You can also select more than one ruleset.

The THOR scan is performed with the default settings and the
custom ruleset. The default signatures are not applied.

.. figure:: ../images/mc_ioc-ruleset-selection.png
   :alt: Select Ruleset while creating a scan job

   Select Ruleset while creating a scan job

.. note::
   To scan exclusively with the custom ruleset, the flag 
   ``--customonly`` must be set (1,2). See
   `THOR Flags <https://thor-manual.nextron-systems.com/en/latest/usage/flags.html#feature-extras>`_
   for more information.

Integrating IOCs through MISP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note::
   To use MISP events and their IOCs for scanning, you
   need to link the Management Center with a MISP instance first. See
   :ref:`administration/additional:link misp` for reference.

The Management Center provides an easy-to-use interface for integrating IOCs from
a connected MISP into THOR scans. To add rules from a MISP,
navigate to ``IOC Management`` > ``MISP`` > ``MISP Events``, select
the IOCs and add them to the desired ruleset by using the button in
the upper-right corner.

There is no default ruleset for MISP. You must create at least one
ruleset (see tab "MISP Rulesets") before you can add MISP rules.


.. figure:: ../images/mc_misp-events.png
   :alt: MISP events

   MISP events 

To create a new ruleset, click ``Add MISP Ruleset`` in the
``IOC Management`` > ``MISP`` > ``MISP Rulesets`` tab. Select a name
and the type of IOCs you want to use in this ruleset. By default, all
types are selected, but there may be reasons for deselecting certain
categories. For example, filename IOCs tend to cause false positives
and may be deselected for that reason. The picture below shows the
dialog for adding a MISP ruleset. Enable ``Apply Changes Automatically`` to
compile new MISP events into the ruleset when they arrive.

.. figure:: ../images/mc_new-misp-ruleset.png
   :alt: Adding a new MISP ruleset

   Adding a new MISP ruleset

To use a MISP ruleset in a scan, add the ruleset in the
``MISP Signatures`` field when creating your scan.

.. figure:: ../images/mc_scanning-with-misp-ruleset.png
   :alt: Scanning with MISP Ruleset

   Scanning with MISP Ruleset

MISP Attributes used by the Management Center
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Not all information and attributes in a MISP event are relevant to the
Management Center and the THOR scanner. The Management Center uses the
following attributes:

   * hostname
   * ip-dst
   * domain
   * domain-ip>hostname
   * domain-ip>ip-dst
   * domain-ip>domain
   * filename
   * filepath
   * file>filename
   * file>filepath
   * file>md5
   * file>sha1
   * file>sha256
   * md5
   * sha1
   * sha256
   * yara
   * yara>yara
   * sigma

.. warning:: 
   Only attributes with the flag ``IDS`` set to ``true`` will be used
   by the Management Center. Make sure that the flag is set if you
   intend to use specific events or attributes.
