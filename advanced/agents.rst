.. index:: Agent and Agent Installer Update

Agent and Agent Installer Update
================================

When a new ASGARD agent version is available, an indicator appears on the
``Update`` menu item and on the ``Update`` > ``Agents`` submenu. Two tasks are
required: update the agents on your assets and update the agent installer for
future asset deployments.

Agent Update
^^^^^^^^^^^^

If this is the first agent update performed on this ASGARD system, you might
need to enable the ``Update Agent`` module under ``Settings`` > ``Advanced`` >
``Show Advanced Tasks``.

Then run the ``Update Agent`` module. You can update individual assets by
running a playbook from ``Asset Management``, or you can create a
``New Group Task`` from ``Response Control``, which is the preferred method.
To roll out the update in batches, provide labels for each stage. To update
all assets, do not select a label.

.. figure:: ../images/mc_agent-update-group-task.png
   :alt: Example Group Task for Agent Update

   Example Group Task for Agent Update

.. note::
   The ``Update Agent`` module is not shown by default under (Group)
   Tasks. To show the group task or single tasks, including tasks inside a
   group task, select the ``Update Agent`` module from the ``Module`` column.
   If the ``Module`` column is not shown, select it from ``Column visibility``
   first.

Agent Installer Update
^^^^^^^^^^^^^^^^^^^^^^

Update the agent installer as well, so newly added assets use the current
agent version immediately. This is a manual task that must be performed when a
new version is available. Navigate to ``Downloads`` > ``Agent Installers`` and
click ``Repack Outdated Agent Installers``. This process might take a while to
finish.

.. figure:: ../images/mc_repack-modal.png
   :alt: Repack Agent Installers

   Repack Agent Installers
