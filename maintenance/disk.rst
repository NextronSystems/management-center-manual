.. index:: Regain Disk Space

Regain Disk Space
=================

If your disk usage is growing too fast and free disk space is running
out, you have several options:

1. Increase the size of your disk
2. Delete files that are not needed for operation (i.e. safe to delete)
3. Delete files that are used by Management Center but might no longer be needed

Safe-to-Delete Files
~~~~~~~~~~~~~~~~~~~~

The following files are safe to delete. They are not needed for the
Management Center to operate.

- ``/var/log/asgard-management-center/*.gz``

They are only kept on the system if needed for further processing.
For example, they may be used to save or send log files to another system.
If you do not need or plan to use these files, you can delete them. If you
are unsure, copy them to another system before deleting them.

- ``/var/lib/asgard-management-center/downloads/*`` (except current day)

The files in this folder are generated only for temporary downloads from the
UI and are not needed after the download has finished. The directory uses a
``year/month/day`` substructure. It is safe to delete any files older than
the current day.

Potentially Unneeded Files
~~~~~~~~~~~~~~~~~~~~~~~~~~

- ``/var/lib/asgard-management-center/scan-results/*.gz``
- ``/var/lib/asgard-management-center/generic-results/*``
- ``/var/lib/asgard-management-center/remote-console/protocol/*.gz``

The listed files are the results of THOR scans (scan-results), tasks
(generic-results), and remote console sessions (remote-console). They are not
needed for the Management Center to function, but the data is visible and
available for download in the Management Center. Deleting these files will
not break the Management Center, but you lose
the information provided by the files. If you need the disk space and cannot
increase the disk, delete files older than a given date that you no longer
need. You can do this with a find-remove combination on the command line:

.. code-block:: console

   root@mc:~# find /var/lib/asgard-management-center/<directory> -mtime +<days> -print0 | xargs -0 -r rm

Where ``<directory>`` is one of ``scan-results/*.gz``, ``generic-results/*``,
or ``remote-console/protocol/*``, and ``<days>`` is the number of days you want
to keep. Files and folders older than ``<days>`` days will be deleted.

Example to delete task results older than 30 days:

.. code-block:: console

   root@mc:~# find /var/lib/asgard-management-center/generic-results/* -mtime +30 -print0 | xargs -0 -r rm
