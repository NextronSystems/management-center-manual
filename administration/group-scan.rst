.. index:: Group Scan

Scan a Group of Systems
=======================

A group scan is a scan task assigned to one or more assets. You define
conditions, either with labels or the Search Query, to specify which
assets should be scanned. Use group scans to assign identical scans, with
the same settings and configuration, to multiple assets.

Create Group Scans
~~~~~~~~~~~~~~~~~~

Create a scan for a group of systems in the ``Scan Control`` > ``Group Scans``
tab. Click the ``Add Group Scan`` button in the upper-right corner.

.. figure:: ../images/mc_group-scan.png
   :alt: Scan Control – Create Group Scan

   Scan Control – Create Group Scan

As with single scans, you can set various parameters. In addition to the
parameters already described, you can also configure the following:

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - Parameter
     - Value
   * - **Description**
     - Freely selectable and optional name for the group scan
   * - **Scan Target**
     - Defines which assets should be scanned with this group scan.
       You can either use the ``Simple`` target option, which uses labels,
       or the ``Advanced`` target option, which uses labels or the
       Search Query. Leaving this option empty scans all assets.
   * - **Expires**
     - After this time frame, no scan orders are issued to connected agents.
   * - **Scheduled Start**
     - Select a date for a scheduled start of the scan.
   * - **Limit**
     - Specifies the maximum number of scans this group scan assigns. Once the
       limit is reached, no more scans are issued. Set a limit higher than the
       number of hosts you want to scan, or enter ``0`` for no limit. If you
       are using a Master Management Center, this limit applies to each
       selected Management Center.
   * - **Rate**
     - The rate at which the Management Center issues new scans. This option
       helps control network load because each scan requires the asset to
       download THOR from the Management Center. We recommend using this
       parameter in virtualized and
       oversubscribed environments to limit the number of parallel scans on
       your endpoints.
   * - **Max. Concurrent Scans**
     - Limits the number of concurrent scans running at once. When the limit is reached,
       no new scans will be started until one of the running scans is completed or failed.
   * - **Max. Runtime**
     - A started scan is cancelled after exceeding the maximum runtime. This is
       used to stop hanging or unresponsive scans.

After configuring your group scan, you can either **Add the Group Scan** or
**Add and Activate the Group Scan**. Adding the group scan without activating
it parks the scan until it is activated, at which point scans are issued.

List of all Group Scans
~~~~~~~~~~~~~~~~~~~~~~~

The list of all group scans contains, among other items, the unique scan ID
and the name.

.. figure:: ../images/mc_group-scan-view.png
   :alt: Group Scans - List

   Scan Control – Group Scans – List

It also shows information about the selected scanner, selected parameters,
start and completion times, and affected assets defined by labels. You can
add columns by clicking "Column Visibility".

The Status field can have the following values:

.. list-table::
   :header-rows: 1
   :widths: 20, 80

   * - Status
     - Value
   * - **Paused**
     - The group scan has not yet started. Click play or wait
       for the scheduled start date. The job starts in a 5-minute window around the scheduled time.
   * - **Active**
     - The scan has started, and the Management Center issues scans with the given parameters.
   * - **Inactive**
     - No additional scan jobs are issued. All single scans that are currently running continue to run.
   * - **Completed**
     - The group scan is completed. No further scan jobs will be issued.

Starting a Group Scan
~~~~~~~~~~~~~~~~~~~~~

Start a group scan by clicking the "play" button in the "Actions" column.
The scan is then listed as "Started".

Details of a Group Scan
~~~~~~~~~~~~~~~~~~~~~~~

You can view more information about a group scan in its detail sidebar.
Click the arrow in the left column of the group scan to open the details
section on the right side of the window.

.. figure:: ../images/mc_group-scan-details.png
   :alt: Scan Control – Group Scans – Details

   Scan Control – Group Scans – Details

In addition to information about the group scan in the "Details" tab, the
"Charts" tab shows a graph with the number of assets started and completed.
The "Tasks" tab shows information about the scanned assets.
