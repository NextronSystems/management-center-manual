.. index:: Licensing

Licensing
=========

ASGARD requires an issuer license to scan systems.
The issuer license contains the number of asset, server, and
workstation systems that can be scanned with ASGARD Management
Center as well as the Aurora service licenses.

ASGARD automatically issues a valid single license for a
specific system during its initial THOR scan.

The screenshot below shows the licensing section of an ASGARD.

.. figure:: ../images/mc_licensing.png
   :alt: ASGARD licensing

   ASGARD licensing

In addition, ASGARD can create single licenses that can be used
for agentless scanning. In this case, the license is generated
and downloaded through the web frontend.

.. figure:: ../images/mc_generate-licenses.png
   :alt: Generate licenses

   Generate licenses

The following systems require a workstation license to be scanned:

* Windows 7 / 8 / 10 / 11
* Mac OS

The following systems require a server license to be scanned:

* All Microsoft Windows server systems
* All Linux systems

Licenses are hostname-based except for asset licenses. Asset
licenses are issued for each accepted asset as soon as a response
action is performed (playbook or remote console access).

Thunderstorm
^^^^^^^^^^^^

You can upload your THOR Thunderstorm license in the lower box of the
``Licenses`` view. The Thunderstorm license must use the same hostname
as the ASGARD system.
