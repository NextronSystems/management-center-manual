.. index:: Managing Logs

Managing Logs
=============

This chapter describes two types of logs. The first type is
:ref:`maintenance/logs:system logs`, which are stored independently on the
system and are not linked to scan results.

The second type is THOR :ref:`maintenance/logs:scan logs`, which are collected
by the agent whenever you issue a scan. These scan logs are linked to your
(group) scans and should
not be deleted, unless you need to :ref:`maintenance/disk:regain disk space`.

System Logs
-----------

The Management Center stores all system logs under ``/var/log/asgard-management-center/log``.

The following table lists the logs and their source:

.. csv-table::
   :file: ../csv/asgard-logs.csv
   :widths: 22 42 37
   :delim: ;
   :header-rows: 1

.. [1] Only if ``--syslog %asgard-host%`` is used during scanning.
       Use this option if you want to receive THOR logs in real time.

.. note::
   Some of the logs above can be forwarded via syslog. See
   :ref:`administration/syslog:syslog forwarding` for a full list
   of log types that can be forwarded via syslog.

Log Rotation and Retention
~~~~~~~~~~~~~~~~~~~~~~~~~~

System logs are automatically rotated at a set interval. Keep in mind how
long logs are stored on the system before they are purged. All logs are
rotated and compressed into one file each month, for up to 14 months.

To understand how log rotation is handled, inspect
``/etc/logrotate.d/asgard-management-center``.

If you want to keep logs for longer, transfer them to another system after
they have been archived and compressed.

Do not change any logrotate configuration manually, as it will be overwritten
with every update.

Scan Logs
---------

Your Management Center stores all scan logs under
``/var/lib/asgard-management-center/scan-results``.

All scans generate two files: ``thor-<ID>.txt.gz`` and
``thor-report-<ID>.html.gz``. The first file contains the raw THOR scan log,
and the second file contains the HTML report. The numeric value in the file
name is the scan ID, which can be found in the Scan Control view. Enable the
``ID`` column, since it is not enabled in the default view.

For scans started with the ``--json`` flag, additional log files are placed in
the scan-results directory and named ``thor-<ID>.json.gz``. These JSON log
files are not transferred to any connected Analysis Cockpit.
