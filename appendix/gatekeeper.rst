.. index:: Bypass Apple verification during installation of asgard2-agent

Bypass Apple verification during installation of asgard2-agent
==============================================================

This section describes workarounds for IT administrators and IT packaging
teams that need to bypass Apple verification and install the personalized
``asgard2-agent`` on macOS Big Sur or newer workstations.


Starting with macOS 15
~~~~~~~~~~~~~~~~~~~~~~~

**Option 1: Remove the quarantine flag from the ASGARD Agent installer in a terminal session**

.. code-block:: console

   MacBook-Pro:~ nextron$ sudo xattr -rd com.apple.quarantine /Users/nextron/Downloads/asgard2-agent-macos-arm64.pkg

**Option 2: Unblock the installer via the Security Settings**

1. Navigate to ``System Settings`` > ``Privacy & Security`` > ``Security``
2. Click the ``Open anyway`` button next to ``asgard2-agent-macos-arm64.pkg ...``

.. figure:: ../images/macos_privacy_and_security_security.png
   :scale: 72
   :alt: macOS Privacy & Security

Before macOS 15
~~~~~~~~~~~~~~~
.. warning::
   Executing this workaround puts your system at risk for a short period of
   time. It temporarily disables global operating system security mechanisms
   that protect system integrity. Follow the steps carefully and enable those
   security mechanisms again after you are done.

After performing any of the described actions, check your system to ensure that
all security mechanisms are in place and reactivated.

Follow these steps to install the ASGARD Agent on macOS.

1. Open a new terminal session

2. Deactivate macOS Gatekeeper

   * ``sudo spctl --master-disable``

3. Close the terminal and open a new terminal session

4. Install the asgard2-agent

   * ``sudo installer -pkg /path/to/asgard2-agent-macos-amd64.pkg -target /``

5. Close the terminal and open a new terminal session

6. Reactivate macOS Gatekeeper

   * ``sudo spctl --master-enable``

.. warning::
   Make sure to activate macOS Gatekeeper when you are done:
   
   ``sudo spctl --master-enable``

You can verify the state of the macOS Gatekeeper with:

.. code-block:: console

   MacBook-Pro:~ nextron$ spctl --status
   assessments enabled

On a system with activated Gatekeeper, the output must be ``assessments enabled``.
