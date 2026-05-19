.. index:: Advanced Settings

Advanced Settings
=================

The Advanced tab lets you specify additional global settings.
The session timeout for the web-based UI can be configured. The default
is one hour. If ``Show Advanced Tasks`` is set, ASGARD will
show system maintenance jobs (e.g. update ASGARD Agent on endpoints)
within the Response Control section.

Inactive assets can be hidden in the Asset Management section
by setting a suitable threshold for ``Hide inactive Assets``.

.. figure:: ../images/mc_advanced-settings.png
   :alt: Advanced Settings

   Advanced Settings

Preview Signatures
------------------

The "preview" channel (formerly known as ``SigDev``) provides access to the
newest signatures and rules. These signatures have passed automated quality
checks, but they have not completed the full manual testing process.

Use preview signatures only when access to the newest rules is more important
than the potential for a higher false-positive rate. We generally recommend
using these rules only if the currently available signatures are a few days old.

To enable the ``Preview`` channel for THOR signatures in the ``Version Pinning``
section, activate the checkbox ``Show Signature Preview Channel`` and
submit your changes.

.. figure:: ../images/mc_preview-signatures.png
   :alt: Preview Signatures

   Preview Signatures

Once you have enabled the option, you can create a version constraint in the
Version Pinning section:

.. figure:: ../images/mc_preview-constraint.png
   :alt: Preview Signatures Scanning

   Preview Signatures Scanning
