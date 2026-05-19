.. index:: User Settings

User Settings
=============

The following settings affect only the currently logged-in user.

Changing Your Password
^^^^^^^^^^^^^^^^^^^^^^

To change your password, click your username in the upper-right
corner and click ``User Settings``. This opens the
personal user settings.

.. figure:: ../images/mc_user-settings.png
   :alt: Changing your password

   Changing your password

Two-Factor Authentication
^^^^^^^^^^^^^^^^^^^^^^^^^

We are currently using the ``Time-based One-time Password (TOTP)``
algorithm for two-factor authentication. We recommend
one of the following mobile apps for 2FA:

   - Google Authenticator
   - Microsoft Authenticator
   - Twilio Authy
   - iOS built-in Password Manager (iOS 15 or newer)

Enable Two-Factor Authentication
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To enable two-factor authentication, click ``Use Two Factor Authentication``
in your User Settings and follow the instructions on the screen.

.. figure:: ../images/mc_enable-2fa.png
   :alt: Enable 2FA

After clicking the button, you will be presented with a QR
code for the authenticator app of your choice.
Alternatively, you can use the secret key. You will need
to verify the 6-digit token and click ``Validate Two Factor Authentication``
to enable 2FA.

.. figure:: ../images/mc_verify-2fa.png
   :alt: Verify 2FA

.. note:: 
   You will be logged out of your current session if validation is successful.

Disable Two-Factor Authentication
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To disable 2FA, navigate to ``User Settings`` > ``Two Factor Authentication``
and click ``Deactivate Two Factor Authentication``.

.. figure:: ../images/mc_deactivate-2fa.png
   :alt: Deactivate 2FA

If you have administrator permissions and want to disable 2FA for another user, navigate to
``Settings`` > ``Authentication`` > ``Users`` and click "Edit" on the user
for whom you want to disable 2FA. Clear ``2FA Active`` and click "Edit User".

.. figure:: ../images/mc_admin-deactivate-2fa.png
   :alt: Deactivate 2FA as administrative user

API Key
^^^^^^^

To generate an API key, navigate to ``User Settings`` > ``API Key``.

This page allows you to set an API key. If an API key was previously set,
a new key will be generated. You will only be able to see your new API key
once after it has been generated.

.. note:: 
   An API key always has the access rights of the
   user context in which it was generated. To create a
   restricted API key, add a new restricted user and generate an API key
   in the new user's context.

.. warning:: 
   The API key has the same rights as your user. Do not use your
   API key as a token for license generation and license / THOR download.
   Instead, use the download token from the ``Downloads`` menu
   (:ref:`administration/download:download links`).
