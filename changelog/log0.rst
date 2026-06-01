Management Center v4.0
======================

Management Center 4.0.1
-----------------------

Release Date: Mon,  1 Jun 2026 11:07:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed agents not restarting after their asset was deleted, preventing them from creating a new asset request
    * - Bugfix
      - Fixed incorrect migration of LDAP host entries containing a protocol prefix
    * - Bugfix
      - Fixed missing UUIDs for group tasks and scheduled group tasks on Master ASGARDs
    * - Bugfix
      - Fixed large syncs to Master ASGARD exceeding the MariaDB transaction placeholder limit
    * - Bugfix
      - Fixed 2FA failing after upgrade by encrypting TOTP secrets at rest and auto-migrating legacy v3 and v4.0.0 secrets to the new format.

Management Center 4.0.0
-----------------------

Release Date: Fri, 15 May 2026 14:07:00 +0200

----

**Breaking Changes**

- The following tables have been updated to use UUIDs as primary keys instead of
  auto-incrementing integers:

  - Assets
  - Asset Requests
  - Tasks/Scans
  - Group Tasks/Scans
  - Scheduled Group Tasks/Scans
  - MISP data (misp_events, misp_attributes, misp_tags, and mapping tables)
  - Users
  - Roles
  - LDAP Roles

  For more information, refer to the `database migration guide
  <https://knowledge.nextron-systems.com/asgard-management-center/db-breaking-changes-guide>`_

- Various API endpoints have been updated to use UUIDs instead of integer IDs.
  Refer to the updated API documentation for details. A list of all changes is
  available in the `API breaking changes guide
  <https://knowledge.nextron-systems.com/asgard-management-center/api-breaking-changes-guide>`_
- The config has been migrated from key-value pairs to a structured YAML format.
- Product update behavior changed. v4 uses version pinning and constraints to control
  which THOR, Aurora, and signature versions are used. Each product can be configured
  with one or multiple constraints (e.g., ``10.*``, ``10.7.*``, etc.) to define which
  versions should be used. Existing update settings are migrated, but you should review
  them after the upgrade.
- All playbook file uploads now use ZIP format instead of tar.gz. Existing files
  collected by the Collect File and Collect Directory playbooks will be automatically
  converted during the update process. The Collect File and Collect Directory playbooks
  now support a password for encrypting the resulting ZIP. Collected files will include
  the base directory name in their path (e.g., report/file.txt instead of file.txt)
- Endpoint license handling has been revised: THOR and Aurora endpoint licenses now
  expire after a maximum of 90 days, ensuring that licenses assigned to decommissioned
  or inactive systems automatically return to the license pool. Licenses already
  assigned to assets before the update will not be affected.
- Legacy components removed: Bifrost sample quarantine and LogWatcher real-time event
  monitoring have been removed.

----

**Highlights**

- THOR 11 Integration: Added support for THOR 11 readiness.
  This includes revised scan flags, updated output formats, and a reworked THOR
  versioning and update server layout.
- AIX is now officially supported through the new ASGARD Agent for AIX and the dedicated
  THOR for AIX scanner. THOR for AIX uses its own license type, purchasable alongside
  the ASGARD Management Center license.
- Software Inventory: Software installed on assets is now accessible in a dedicated
  Software Inventory section. This section provides a comprehensive overview of all
  installed software across all assets, either in a per-asset or aggregated view. The
  software list tab in the asset details now also allows searching and filtering
  installed software.
- Live Event Streaming: Real-time THOR event forwarding to ASGARD Analysis Cockpit has
  been added. The option can be enabled with a checkbox in the Scan Settings for single,
  group, and scheduled scans.
- Encrypted Evidence Collection: Collect File and Collect Directory playbooks now
  support password-encrypted zip files.
- Improved Update Version Control: More control over product versions with
  constraint-based pinning.

----

**Features**

- New license type "THOR for Legacy" has been added to support scanning older Windows
  and Linux systems no longer covered by standard THOR. The ASGARD Management Center can
  now issue Legacy licenses.

----

**Improvements**

- MISP entities (except the rulesets) are now stored with an internal UUID, the original
  ID is preserved in a new column `source_id`
- Scans Table > Scan Arguments now only shows actually set arguments, empty values are
  hidden for a cleaner look
- API Keys now use improved security standards for storage
- Custom Hash and C2 IOCs now support assigning a custom score to each IOC
- Generating and downloading a Diagnostics Pack now requires admin privileges

----

**Changed**

- Default playbooks are now only created during installation or updates, not on every
  start of the ASGARD Management Center.
- Default Sigma rulesets are now only created during installation or updates, not on
  every start of the ASGARD Management Center.
- Default service configurations are now only created during installation or updates,
  not on every start of the ASGARD Management Center.

----

**Bugfixes**

- Fixed wrong value being stored for `3 day` option in Advanced Settings > Hide
  Assets/Resume Deadline
- Fixed wrong thunderstorm collector example on Thunderstorm page
- Assets can no longer be deleted while they have any active service
- Fixed new license installs not replacing the old client certificate
- Fixed path-splitting in File Browser for macOS agents
- Fixed File Browser ZIPs from Windows assets containing backslashes instead of forward
  slashes
- Fixed Playbook CommandLine output not being collected when command failed
