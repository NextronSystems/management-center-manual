.. index:: Updates

Updates
=======

ASGARD Updates
^^^^^^^^^^^^^^

ASGARD will search for ASGARD updates on a daily basis. Available
updates will automatically be shown in the section ``Updates``. 

As soon as an ASGARD update is available, a button ``Upgrade from ... to ...``
appears. Clicking this button will start the update process. The
ASGARD service will be restarted and the user will be forced to
re-login. Generally update MASTER ASGARD before the connected ASGARDs.

.. figure:: ../images/mc_update-asgard.png
   :alt: Updating ASGARD

   Updating ASGARD

Version Pinning
^^^^^^^^^^^^^^^

The ``Version Pinning`` section allows you to create constraints
to "pin" a specific version of THOR, Aurora, or any signatures.
This allows you to stick with certain major or minor versions
of our products.

By default, ASGARD will search for signature updates every hour
and for THOR/Aurora updates every day. You can change the update
interval if needed, though the default values are usually sufficient
for most cases.

If you want to manually check if a new update is available, you can
do so by clicking ``Check for Updates``. This will not download new
versions, but only check if new versions - according to your pinning
constraints - are available.

If new updates are available, you can manually download them via the
``Update Products Now`` button.

.. figure:: ../images/mc_version-pinning.png
   :alt: Version Pinning

   Version Pinning

Setting a new version pinning configuration is straightforward:

- Select your Product
- Select the Channel
- Select a Constraint

.. figure:: ../images/mc_version-constraint.png
   :alt: Version Constraint

   Version Constraint

Agent Updates
^^^^^^^^^^^^^

If an asset or an agent can be update, there will be a notice
shown in the ``Updates`` > ``Agents`` tab.

.. figure:: ../images/mc_agent-update.png
   :alt: Update Agent

   Update Agent
