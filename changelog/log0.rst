Management Center v4.0
======================

Management Center 4.0.0
-----------------------

Release Date: 

----

**Breaking Changes**

- The below tables have been updated to use UUIDs as primary keys instead of auto-incrementing integers:

  - Assets
  - Asset Requests
  - Tasks/Scans
  - Group Tasks/Scans
  - Scheduled Group Tasks/Scans
  - MISP data (misp_events, misp_attributes, misp_tags, and mapping tables)
  - Users
  - Roles
  - LDAP Roles

  For further information please refer to the
  `database migration guide <https://knowledge.nextron-systems.com/asgard-management-center/db-breaking-changes-guide>`_

- Various API endpoints have been updated to use UUIDs instead of integer IDs.
  Please refer to the updated API documentation for details. You can find a
  list of `all changes here <https://knowledge.nextron-systems.com/asgard-management-center/api-breaking-changes-guide>`_
- The config has been migrated from key-value pairs to a structured yaml format.
- Product Updates (THOR & THOR Signatures, Aurora & Aurora Signatures) Updates are now managed through version pinnings.
  Each product can be configured with one or multiple constraints (e.g., ``10.*``, ``10.7.*``, etc.) to define which versions should be used.
  This allows for more flexible update management and better control over product versions in your environment,
  new versions that match the constraints will be automatically be used in scans and services.
- All playbook file uploads now use zip format instead of tar.gz.
  Existing playbook files will be automatically converted during the update process.
  The Collect File and Collect Directory playbooks now support a password for encrypting the resulting zip.
- Endpoint license handling has been revised: THOR and Aurora endpoint licenses now expire after a maximum of 90 days, 
  ensuring that licenses assigned to decommissioned or inactive systems automatically return to the license pool.
- Removed Bifrost Support
- Removed deprecated LogWatcher

----

**Highlights**

- THOR 11 Integration: Added support for the upcoming THOR 11, which is expected in 2026.
- AIX is now officially supported through the new ASGARD Agent for AIX and the dedicated THOR for AIX scanner.
  THOR for AIX uses its own license type, purchasable alongside the Asgard Management Center license.
- Software Inventory: Software installed on assets is now accessible in a dedicated Software Inventory section.
  This section provides a comprehensive overview of all installed software across all assets, either in a per-asset or aggregated view.
  The software list tab in the asset details now also allows searching and filtering installed software.
- Live Event Streaming: Real-time THOR event forwarding to Asgard Analysis Cockpit
  The option can be enabled with a checkbox in the Scan Settings for single, group and scheduled scans.
- Modernized codebase foundation to accelerate future development

----

**Features**

- New license type "THOR for Legacy" has been added to support scanning older Windows and Linux systems no longer covered by standard THOR.
  The Asgard Management Center can now issue Legacy licenses, with full Legacy support planned for an upcoming release,
  in which the agent will automatically determine whether a system should be scanned using THOR or THOR Legacy and which license type is required.

----

**Improvements**

- MISP entities (except the rulesets) are now stored with an internal UUID, the original id is preserved in a new column `source_id`
- Scans Table > Scan Arguments now only shows actually set arguments, empty values are hidden for a cleaner look
- API Keys are now hashed with SHA-256 instead of encrypting with AES

----

**Changed**

- Default playbooks are now only created during installation or updates, not on every start of the management-center.
- Default sigma rulesets are now only created during installation or updates, not on every start of the management-center.
- Default service configurations are now only created during installation or updates, not on every start of the management-center.

----

**Bugfixes**

- Fixed wrong value being stored for `3 day` option in Advanced Settings > Hide Assets/Resume Deadline
- Fixed wrong thunderstorm collector example on Thunderstorm page
- Assets can no longer be deleted while they have any active service