Management Center v4.2
======================

Management Center 4.2.0
-----------------------

Release Date: Wed, 23 Sep 2026 11:30:00 +0200

----

**Highlights**
    
- Single Sign-On (SSO) support for OpenID Connect (OIDC) and SAML 2.0, configurable from the admin Settings UI.

----

**Single Sign-On (SSO)**

* OpenID Connect (OIDC):

  - SP-initiated login and authorization-code callback flow.
  - PKCE (Proof Key for Code Exchange) support, toggleable per
    configuration.
  - JWE-encrypted token support: ID token and logout token decryption with
    configurable keys, key-management algorithms (RSA-OAEP-256, RSA-OAEP,
    ECDH-ES and variants) and content-encryption algorithms
    (A128CBC-HS256, A256GCM and variants).
  - Configurable scopes and groups claim for role mapping.
  - Back-channel logout (server-to-server) with signed logout-token
    validation. Session IDs in logout tokens can optionally be required.
  - Front-channel logout (browser-driven) with issuer and session-ID
    matching. A logout request carrying neither is rejected, since it can
    never be matched to a session.

* SAML 2.0:

  - SP-initiated login with signed AuthnRequest, and IdP-initiated login
    via the Assertion Consumer Service.
  - Assertions must be signed. The enforcement can be opted out of for an
    IdP that signs the enclosing Response alone, such as Keycloak with
    "Sign Documents" but without "Sign Assertions".
  - IdP metadata via URL (auto-refresh), pasted XML, or manual entry.
  - SP keypair management and SP metadata endpoint for IdP configuration.
  - Configurable NameID format, ForceAuthn, and attribute-to-user mapping.
  - IdP-initiated Single Logout (SLO) over HTTP-Redirect and HTTP-POST
    bindings, with LogoutResponse relayed back to the IdP.
  - Logout hardening: signed-logout enforcement, SHA-1 signature
    rejection, and logout-message max-age validation.

* Configuration:

  - Admin UI to configure and test SSO.
  - Write-only secrets (client secret, SP signing key, JWE decryption keys)
    never returned by the API. A saved or tested configuration that omits
    one inherits it from the stored configuration, but only while it still
    names the same identity provider, so the secrets cannot be carried over
    to a provider of the caller's choosing.
  - SSO configuration changes recorded in the audit log, along with the
    outcome of every SSO login and Single Logout: one entry per session a
    logout terminated, and an entry for each denied login and each rejected
    or unfulfillable logout message. A rejected logout leaves the session
    intact and is reported in the running application.

* Limitation:

  - logging out of the Management Center ends the local session
    only. Logout is not propagated to the identity provider, so its session
    stays open and the next login can be answered without a credential
    prompt. For SAML, enabling ForceAuthn makes the IdP re-authenticate the
    user on every login.

----

**User provisioning (LDAP and SSO)**

- LDAP and SSO users are provisioned as regular users, so they appear in
  the user list and carry roles, permissions and preferences like local
  accounts.
- Group-to-role mapping is configured the same way for both sources, with
  an optional default role per source for users whose groups match none of
  the mappings. Group mappings take precedence, roles are re-resolved on
  every login, and leaving the default empty rejects users without a
  matching group.
- SSO users are read-only in the user list; only the "Disabled" toggle can
  be changed, as every other field is managed by the identity provider. The
  password and role fields are hidden when editing LDAP users, as both are
  managed by the directory.
- TOTP-based two-factor authentication is available to LDAP users,
  previously limited to local users. SSO users get their second factor from
  the identity provider and are not offered one here.

----

**Features**

- API keys for LDAP users, previously limited to local users. An LDAP API
  key resolves its permissions from the user's current directory groups:
  cached groups are reused briefly and re-queried afterwards, and once they
  exceed the maximum age a successful directory query becomes mandatory, so
  a prolonged LDAP outage denies LDAP API keys instead of serving
  permissions of unbounded age.
- API keys for SSO users, disabled by default and enabled in the SSO
  configuration. Such a key carries the permissions captured at its owner's
  last interactive login and cannot be refreshed when the key is used, so a
  group change or a deprovisioning at the identity provider does not reach
  it. While the option is off, key creation is refused with an explanation
  rather than handing out a key that cannot authenticate.
- Configurable password policy: minimum length, separate minimum for users
  with 2FA, maximum length, character-class requirements (digit, symbol,
  upper, lower) and a NIST SP 800-63B compliance mode. Configured from the
  User Defaults dialog and enforced on password changes. The default
  minimum length is now 15 characters, in line with NIST SP 800-63B.
- Automatic deactivation of inactive local users after a configurable
  number of days, set as a default for new users and adjustable per user.
  LDAP and SSO accounts are governed by their directory or identity
  provider and are not deactivated this way.

----

**Improvements**

- The LDAP configuration is now stored in the database and is migrated
  automatically during the update.
- Interface preferences of LDAP users are migrated to the standard user
  preferences, so they survive as regular per-user settings.
- On a Master ASGARD, the IP-based fallback settings are shown once per
  managed ASGARD. The fallbacks live in each Management Center's own
  database and only reach agents through its installers.
- The column preferences of the Users and Roles tables are reset during
  the update. Their columns are now named after the fields the server
  filters and sorts by, and a stored preference selects columns by their
  previous names, so both tables return to their default column set.
- Audit events name the initiator's roles in a new "role_ids" array. A local
  account holds exactly one role, but an SSO or LDAP user can hold several,
  through a group mapped to several roles or through several mapped groups.
  The scalar "role_id" of earlier releases is no longer emitted, rather than
  changing that key's type under existing consumers.
- The Users API keeps its "role_id" key but now returns an array of role
  objects in it, where earlier releases returned a single role ID, since an
  SSO or LDAP user can hold several roles. Consumers that read "role_id" as
  a scalar need to be adjusted.

----

**Bugfixes**

- Fixed the session-expiry re-login dialog rejecting LDAP accounts. LDAP
  usernames no longer carry the "ldap:" prefix of earlier releases, so the
  dialog authenticates against the directory under the username it knows.
- Fixed StartTLS connections to an LDAP directory failing when no server
  name was configured. The certificate is verified against the host that
  was dialed, and the Server Name field is now offered for StartTLS as
  well, not only for SSL/TLS.
- Testing an LDAP configuration no longer requires the fields the test does
  not use: a connection test needs the host, a bind test the bind
  credentials, and an authentication test the search settings. An
  incomplete configuration is still refused when it is saved while enabled,
  and a missing field is now named on the input it belongs to.
- Log rotation now caps every log file at 5 GB, down from the 20 GB and
  50 GB of earlier releases, so a log that grows quickly between the daily
  or monthly rotations is rotated before it fills the disk.
- Reduce network traffic between the Master ASGARD and Management Center by
  excluding the obsolete products/nextron directory from synchronization.

----

**Security**

- The read-only restriction is now enforced for every API request, on a
  Master ASGARD before the request is forwarded to a managed ASGARD.
- Sessions are revalidated against the user store on every request, so
  disabling or deleting a user ends their existing sessions instead of
  leaving them valid until the session times out.
- The administrator account cannot be disabled, and neither its role
  assignment nor the administrator role itself can be modified, so an
  installation cannot be locked out of its own administration.
- Added a Referrer-Policy of strict-origin-when-cross-origin, so URL paths
  and query strings are no longer sent to third parties such as the SSO
  identity provider, and extended the Content Security Policy with the
  object-src, base-uri and form-action directives, which do not inherit
  from default-src.
- The auto-submit form used for SAML logout over the HTTP-POST binding is
  served under its own restrictive policy instead of the site-wide one, with
  its inline script allowed by nonce only.
- Authentication cookies are now sent with SameSite=Strict and without an
  expiry, so browsers keep them in memory and drop them when they close.
