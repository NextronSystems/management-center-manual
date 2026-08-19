Broken File and Folder Permissions
----------------------------------

In a normal installation, the Endpoint Agent folder uses specific permissions.
The Endpoint Agent regularly checks for broken permissions and tries to fix
them. If this process fails, check and change the permissions manually.

.. code-block:: none

   2023/03/31 12:02:35 ASGARD_THOR: Error: failed to repair permissions: set security info: Access is denied.

The following PowerShell script can help with this process. Test the script
before deploying it in your environment. Keep the ``-WhatIf`` flag enabled to
see what the script would do if permissions are broken. If the expected changes
are correct, remove the ``-WhatIf`` arguments. The script requires
administrative permissions.

.. literalinclude:: ../scripts/fix_broken_acls.ps1
   :language: powershell
   :linenos:
   :emphasize-lines: 9, 16, 24

.. tip::
   After you change the permissions of the asgard2-agent folder,
   the agent might correct the permissions again. Only use this script if the
   agent shows errors that permissions cannot be set.
