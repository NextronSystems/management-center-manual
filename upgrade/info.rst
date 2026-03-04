.. index:: General Information about the Upgrade

General Information
===================

Management Center v4 introduces significant improvements
including the preparation for our upcoming THOR 11 Techpreview
Release, Software Inventory, Live Event Streaming, and a
modernized codebase foundation.

.. important::

   Connected to a Master ASGARD?

   If your Management Center is connected to a Master ASGARD,
   it is recommended to upgrade the Master ASGARD to v4 first,
   followed by the connected Management Centers. If a Management
   Center is upgraded before the Master ASGARD, you may see sync
   errors due to incompatibility until the Master is also upgraded.

Breaking Changes
----------------

The following changes require careful migration planning:

- **Database Schema**: Primary keys migrated to UUIDs for
  Assets, Asset Requests, Tasks/Scans, Group Tasks/Scans,
  Scheduled Group Tasks/Scans, MISP data, Users, Roles, and LDAP Roles.
  Please see our `DB Breaking Changes Guide <https://knowledge.nextron-systems.com/asgard-management-center/db-breaking-changes-guide>`_
- **API Updates**: Various endpoints now use UUIDs instead of integer IDs.
  Please see our `API Breaking Changes Guide <https://knowledge.nextron-systems.com/asgard-management-center/api-breaking-changes-guide>`_
- **Configuration**: Migrated from key-value pairs to structured YAML format
- **Product Updates**: THOR & THOR Signatures, Aurora & Aurora Signatures
  now managed through version pinnings with constraint-based updates
- **Playbooks**: File uploads now use zip format instead of tar.gz
  (automatic conversion during update)
- **License Management**: Unused THOR and Aurora endpoint licenses are
  automatically released and returned to the license pool after a maximum
  of 90 days of inactivity
- **Deprecated**: Bifrost Support and LogWatcher have been removed

New Features & Highlights
-------------------------

- **THOR 11 Integration**: Enhanced scanning capabilities with the latest THOR version
- **AIX Support**: Official AIX support with dedicated ASGARD Agent and THOR for AIX
  scanner with its own license type
- **THOR for Legacy**: New license type for scanning older Windows and Linux systems
  no longer covered by standard THOR
- **Software Inventory**: Comprehensive software asset management and tracking
- **Live Event Streaming**: Real-time THOR event forwarding to Asgard Analysis Cockpit
- **Enhanced Playbooks**: Collect File and Collect Directory now support password encryption
- **Modernized Codebase**: Updated foundation to accelerate future development
- **Flexible Update Management**: Better control over product versions with constraint-based pinning

Frequently Asked Questions
--------------------------

- Is the upgrade process automated?
  
  - Yes, the upgrade process is automated. However, it is crucial to back up your data before proceeding.

- Will my existing configurations be preserved?
  
  - Yes, all configurations will be preserved during the upgrade. However, due to the
    completely reworked product updates and version pinning system, it's worth checking the version
    pinning configuration in the Updates settings after the upgrade to ensure the constraints and
    update intervals still fit your requirements.

- Are there breaking API changes in v4?

  - Yes, v4 introduces significant API changes. Many endpoints now use UUIDs instead of integer IDs,
    and product update management has been restructured to use version pinnings. Please review the
    `API Breaking Changes Guide <https://knowledge.nextron-systems.com/asgard-management-center/api-breaking-changes-guide>`_
    for detailed information about all breaking changes.

- Where can I find help if I encounter issues during the upgrade?

  - Please refer to our documentation or contact our support team for assistance.

- How long is the old v3 version supported?

  - v3 will receive critical hotfixes until December 2026.

- How long will the upgrade take?

  - The upgrade typically takes a few minutes, but can take significantly longer in large environments.
    The duration primarily depends on the number of tasks, as synced data from connected Management Centers
    is deleted and resynced during the upgrade. Since this upgrade does not include major OS upgrades and
    requires no reboots, it is significantly faster than the previous major upgrade from v2 to v3. You can
    monitor the upgrade progress in ``/var/log/apt/term.log``.

- Do I need to upgrade my agents to work with v4?

  - No, the upgrade does not require new agents. All currently deployed agents will continue to work
    seamlessly with v4 without any updates needed.

- Will there be any downtime during the upgrade?

  - Yes, the Management Center will be unavailable during the upgrade process. Plan accordingly and
    schedule the upgrade during a maintenance window.

- In what order should I upgrade a Master ASGARD environment?

  - Upgrade the Master ASGARD to v4 first, followed by the connected Management Centers. If a Management Center
    is upgraded to v4 before the Master ASGARD, you may see sync errors until the Master is also upgraded.

- What are the minimum system requirements for v4?

  - The system requirements have not changed since v3. Your current hardware setup will be sufficient for running v4.

- Will the upgrade also upgrade the underlying operating system to the latest major version?

  - No, the upgrade process focuses solely on the Management Center application and minor updates of its dependencies.