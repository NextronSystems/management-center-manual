.. index:: Licensing

Licensing
=========

The Management Center requires an issuer license to scan systems.
The issuer license contains the number of asset, server, and
workstation systems that can be scanned with the Management
Center as well as the Aurora service licenses.

The Management Center automatically issues a valid single license for a
specific system during its initial THOR scan.

The screenshot below shows the licensing section of a Management Center.

.. figure:: ../images/mc_licensing.png
   :alt: Licensing

   Licensing

In addition, the Management Center can create single licenses that can be used
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
as the Management Center.
