.. index:: Helpful scripts

Installing ASGARD Agent via PowerShell Script
---------------------------------------------

The following example script installs the ASGARD Agent with PowerShell.
Place the installer and script in the same folder. Adjust the script as
needed.

.. literalinclude:: ../scripts/install_agent.ps1
   :language: powershell
   :linenos:

Deploy ASGARD Agents via SCCM
-----------------------------

To deploy the ASGARD Agent (or any other .exe installer) via SCCM, you
need a PowerShell script with conditions that mark an installation as
successful or failed.

Refer to Microsoft's `Create applications in Configuration Manager <https://learn.microsoft.com/en-us/mem/configmgr/apps/deploy-use/create-applications#about-custom-script-detection-methods>`_.

.. literalinclude:: ../scripts/install_agent_sccm.ps1
   :language: powershell
   :linenos:

.. warning::
   This is an example script for SCCM.
   If you encounter any problems, refer to the link provided
   above for additional information.

SCCM applications can also use a script to detect the deployment.
You can use this part of the script to detect whether the installation was
successful:

.. code-block:: powershell
   :linenos:

   $servicename = "asgard2-agent"
   if (Get-Service -Name $servicename -ErrorAction SilentlyContinue) {
      Write-Host "ASGARD Agent installed"
      exit 0
   } else {
      $Host.UI.WriteErrorLine("ASGARD Agent not installed")
      exit 1
   }
