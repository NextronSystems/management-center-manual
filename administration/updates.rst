.. index:: Updates

Updates
=======

Management Center Updates
^^^^^^^^^^^^^^^^^^^^^^^^^

The Management Center checks for updates daily. Available
updates are shown automatically in the ``Updates`` section.

As soon as an update is available, the ``Upgrade from ... to ...``
button appears. Click this button to start the update process. The
Management Center service restarts and the user must log in again. In
general, update the Master Management Center before connected
Management Centers.

.. figure:: ../images/mc_update.png
   :alt: Updating the Management Center

   Updating the Management Center

Version Pinning
^^^^^^^^^^^^^^^

The ``Version Pinning`` section allows you to create constraints
to "pin" a specific version of THOR, Aurora, or any signatures.
This allows you to stay on specific major or minor versions
of our products.

By default, the Management Center will search for signature updates every hour
and for THOR/Aurora updates every day. You can change the update
interval if needed, though the default values are usually sufficient
for most cases.

To manually check whether a new update is available, click
``Check for Updates``. This does not download new versions. It only checks
whether new versions are available according to your pinning constraints.

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

If an asset or an agent can be updated, a notice is
shown in the ``Updates`` > ``Agents`` tab.

.. figure:: ../images/mc_agent-update.png
   :alt: Update Agent

   Update Agent
