Management Center v3.3
======================

Management Center 3.3.1
-----------------------

Release Date: Thu, 21 May 2026 12:52:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Bugfix
      - Cleaned up orphaned duplicate tasks and legacy logwatcher table
    * - Bugfix
      - Fixed ASGARD Management Center 4.0 showing as compatible on Master ASGARD 3.3
    * - Bugfix
      - Fixed major upgrade page showing for ASGARDs not eligible for upgrade

Management Center 3.3.0
-----------------------

Release Date: Fri, 15 May 2026 14:06:00 +0200

.. list-table::
    :header-rows: 1
    :widths: 15, 85

    * - Type
      - Description
    * - Feature
      - Preparation for upcoming ASGARD Management Center 4.0 release
    * - Security
      - Addressed an information disclosure vulnerability in user search API endpoints. An authenticated attacker could abuse the condition parameter to enumerate sensitive fields such as password hashes. Thanks to Jorge Escabias from NATO Cyber Security Centre (NCSC) for reporting this
    * - Security
      - OS Security Fix
    * - Bugfix
      - Fixed an issue where retained older versions of signatures were not updated to the new version format
    * - Bugfix
      - Fixed an issue where client requests with many network interfaces could fail to be stored
    * - Bugfix
      - Fixed an issue where the ASGARD Agent could crash on startup on AIX 7300-04 due to incompatibility with the LLU feature newly introduced by AIX
