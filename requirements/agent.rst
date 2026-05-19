.. index:: Agent Requirements

Agent Requirements
------------------

The ASGARD Agent must be installed on endpoints. It is a lightweight
service that establishes a secure connection to your Management Center.
The agent uses around 50 MB of memory, which makes it unobtrusive.
THOR uses up to an additional 2 GB of RAM while a scan is in progress.
This value varies depending on the operating system. Unix systems generally
use less RAM, while Windows endpoints usually use more.

The agent uses up to 50 MB of disk space. Together with THOR and its
temporary files, it uses a maximum of 200 MB in total.

Some response actions, such as collecting triage packs
or collecting the system's RAM, require additional disk space.

There are no specific CPU requirements because scans can be scheduled
so that THOR reduces its own process priority. This limits CPU usage to
a configurable percentage, with longer scan times as the tradeoff. The
separate `THOR Manual <https://thor-manual.nextron-systems.com>`_
describes multiple ways to adapt THOR scans to your environment.

Supported operating systems are the ones
`supported by THOR <https://thor-manual.nextron-systems.com/en/latest/usage/requirements.html#operating-systems>`__.
Operating systems with limited or special THOR support are not supported.
