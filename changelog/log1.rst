Management Center v4.1
======================

Management Center 4.1.3
-----------------------

Release Date: Thu, 13 Aug 2026 21:30:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Improvements
      - Reduced log volume: routine operational messages are now logged at debug level, so the default log level only records events that need attention.
    * - Bugfix
      - Fixed validation of custom signatures failing on Management Centers with a Managed Service license.

Management Center 4.1.2
-----------------------

Release Date: Tue, 11 Aug 2026 13:40:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Fixed scheduled backups not being executed.
    * - Bugfix
      - Fixed playbook commands being mangled when they contain literal dollar signs, e.g. shell variables.

Management Center 4.1.1
-----------------------

Release Date: Wed, 22 Jul 2026 11:00:00 +0200

----

**Features**

- Added preparation for ARM64 architecture support, including ASGARD Agent for Windows ARM64 and Linux ARM64 endpoints. Full ARM support will be available with the upcoming THOR 11 release
- Added IP-based fallback for agent connectivity. Configured IP addresses of Management Centers, brokers, and lobbies are used in addition to their FQDNs, enabling automatic fallback when DNS is not working
- Added automatic detection for endpoints requiring THOR Legacy, in preparation for the upcoming THOR 11 release
- Added option to the agent repacker to avoid using the temp directory on endpoints

----

**Improvements**

- Added support links to the Documentation
- Moved the Diagnostics Package from the Logs section dropdown to the Diagnostics section
- Software Inventory now supports exporting the software list as CSV

----

**Security**

- Updated dependencies to address security vulnerabilities
- Removed file system paths from Go binaries
- Implemented nonce-based Content Security Policy
- Fixed Zip Slip vulnerability in backup extraction process
- Fixed potential OS command execution through rsyslog configuration

----

**Bugfixes**

- Disallowed the asgard field in Group Scan queries to prevent silently-failing scans on Master ASGARD-managed instances. Use the Management Center dropdown to target specific instances instead
- Fixed missing online/offline events in the asset timeline (regression in AMC 3.1.5), detection now relies on Status and StatusSince instead of the old last-seen logic
- Fixed Asgard Agent leaving orphaned worker processes after stop on AIX and non-systemd Linux, which could cause duplicate assets and playbook errors
- Fixed flags parameter in Group Task API endpoints: comma-separated values are now automatically split and trimmed (e.g., "--noscanid, --nosoft, --allhds" is parsed as three flags)
- Fixed incomplete Stdout Preview for Command List in Playbook Results
- Fixed AIX Agent --version flag and help output
- Fixed Windows Agent Installer not requesting admin rights
- Fixed flaky DNS resolution in ASGARD Agent
- Fixed Thunderstorm license validation showing valid for invalid hostname
- Fixed MISP event tags filter not working
- Fixed ASGARD Agent Core not detecting when THOR is killed manually
- Master ASGARD: Show correct version of connected Management Centers
- Fixed migration of 2FA settings during update
- API documentation: Fixed type of IDs now being UUIDs
- Fixed audit messages no longer being extracted into the separate audit log; the entries were still present in the main log
- Fixed handling of unlimited quotas in Master ASGARD licenses; affected installations are repaired automatically during the update
- Fixed agent version not being synced to Master ASGARD
- Fixed a race condition when stopping Thunderstorm
- Fixed the "Collect file from Management Center" action in the Analysis Cockpit not working
