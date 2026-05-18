.. index:: Full Disk Access for macOS asgard2-agent-service via MDM

Full Disk Access for macOS asgard2-agent-service via MDM
========================================================

To create a profile that grants ``Full Disk Access`` (FDA) via MDM, retrieve
the ``codesign`` information from ``asgard2-agent-service``.

To do this, run the following command in Terminal:

.. code-block:: console
   
   MacBook-Pro:~ nextron$ sudo -s
   MacBook-Pro:~ nextron$ codesign -dr - /private/var/lib/asgard2-agent/asgard2-agent-service
   Executable=/private/var/lib/asgard2-agent/asgard2-agent-service
   designated => identifier "client-arm64" and anchor apple generic and certificate ...

Copy the output starting from ``identifier`` into the related field in your MDM
profile.

.. note::
  Granting ``Full Disk Access`` via MDM does not list the granted access in
  macOS ``System Settings``. To check whether the settings from your remote
  deployment have been applied, run the following command in Terminal.
  Temporary FDA for Terminal is required for this check:

  .. code-block:: console

     MacBook-Pro:~ nextron$ /usr/libexec/PlistBuddy -c "print" "/Library/Application Support/com.apple.TCC/MDMOverrides.plist"

You can create the mobileconfig file with the JAMF PPPC utility:
https://github.com/jamf/PPPC-Utility

For further support, refer to the manuals of your MDM provider.
