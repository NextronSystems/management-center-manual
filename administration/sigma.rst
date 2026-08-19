.. index:: Sigma

Sigma
=====

THOR and Aurora use Sigma to improve detections.

What is Sigma?
~~~~~~~~~~~~~~

From the `project website <https://github.com/SigmaHQ/sigma>`_:

.. highlights::

   `Sigma is a generic and open signature format that allows you to
   describe relevant log events in a straightforward manner. The rule
   format is very flexible, easy to write and applicable to any type
   of log file. The main purpose of this project is to provide a
   structured form in which researchers or analysts can describe their
   once developed detection methods and make them shareable with others.`

   `Sigma is for log files what` `Snort <https://www.snort.org/>`_ `is for network traffic and`
   `YARA <https://github.com/VirusTotal/yara>`_ `is for files.`

Creating a Ruleset
~~~~~~~~~~~~~~~~~~

Rulesets group rules into manageable units. As an asset
can only have one service configuration, rulesets are used to determine
which rules are used in each service configuration. Default rulesets are
available for high and critical Sigma rules. To create a custom ruleset, go
to ``Service Control`` > ``Sigma`` > ``Rulesets`` > ``Create Ruleset``.

.. figure:: ../images/sc_create-ruleset.png
   :alt: Create a Ruleset

   Create a Ruleset

If you selected automatic addition of new Sigma rules to the new ruleset,
they are added now. If you did not select any Sigma levels for automatic
addition, add the desired rules manually by going to ``Service Control`` >
``Sigma`` > ``Rules``. Select the checkboxes for the rules you want to add,
then click ``Add to Ruleset``. A rule can be assigned to multiple rulesets.

.. figure:: ../images/sc_add-to-ruleset.png
   :alt: Add a Rule to Rulesets

   Add a Rule to Rulesets

.. note::
    You need to commit and push your changes after editing a ruleset.
    The Management Center must restart the service controller to read new
    configurations.
    To prevent multiple restarts when an administrator performs several
    configuration changes in succession, the administrator must initiate
    the reload of the new configuration by going to ``Service Control`` >
    ``Sigma`` > ``Rulesets`` and performing the **Compile ruleset** action
    (gear wheels). The need for compiling is indicated in the **Uncompiled Changes**
    column.

    .. figure:: ../images/sc_uncommitted-changes.png
       :alt: Uncompiled Changes Indicator
    
       Uncompiled Changes Indicator

Choosing which Rules to Activate
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We do not recommend enabling all available rules on an asset. Start with all
"critical" rules, then advance to all "high" rules. Default rulesets are
available for both levels. "Medium" rules should not be enabled in bulk, and
"low" or "informational" rules should generally remain disabled. Individual
medium rules that increase an organization's detection coverage without
triggering many false positives can be added to the active configuration, but
should be tested rule by rule.

To add rules to a ruleset more easily, use the column filters to select the
desired rules and add them in bulk to a ruleset. For example, you can add all
rules with level "critical" to a ruleset:

    .. figure:: ../images/sc_choose-rules1.png
       :alt: Add all critical rules to a ruleset
    
       Add All Critical Rules to a Ruleset

Another useful way to pivot the Sigma rule database is to use MITRE ATT&CK® IDs.

    .. figure:: ../images/sc_choose-rules2.png
       :alt: Search by MITRE ATT&CK® ID
    
       Search by MITRE ATT&CK® ID

You can also search the title or description field of the rules. To search
the rule itself, use the "Rule" column. The "Rule" column is not shown by
default and must be added with the gear wheel button.

    .. figure:: ../images/sc_choose-rules3.png
       :alt: Search by Rule Title or Description
    
       Search by Rule Title or Description

False Positive Tuning of Sigma Rules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Each environment is different. Some rules may trigger false positive matches
in your environment. You have multiple options to address this.

1. If it is a general false positive that is not limited to your environment,
   consider reporting it as a `GitHub issue <https://github.com/SigmaHQ/sigma/issues>`_
   or by email to rules@nextron-systems.com. We will take care of the tuning
   for you and other users.
2. If the false positive is specific to your environment, you can tune single Sigma rules
   at ``Service Control`` > ``Sigma`` > ``Rules``, filter for the rule in question and
   choose the "Edit false positive filters of this rule" action. Here you can
   perform simple rule tuning. Click the ``Add False Positive Filter`` button
   to add individual lines that filter the event for false positives. These
   lines are OR-connected, which means: "Do not match the event if any of
   those lines matches." They are applied on top of the rule logic and persist
   through automatic rule updates.

    .. figure:: ../images/sc_sigma-fp-tuning.png
       :alt: Example of the false positive tuning of a Sigma rule
    
       Example of the false positive tuning of a Sigma rule

    To see the resulting rule, click the "Show Preview" button or look at the
    "Compiled Rule" row in the rule's drop-down menu.

    To review tuned rules, add the "Filters" column to your view using the
    gear wheels icon, then show all non-empty rows by using the ``NOT -``
    column filter.

3. If the rule adds too much noise and tuning is not practical, you can remove
   the rule from the ruleset for a subset of your systems. This may require a
   separate ruleset for that use case. You can also disable the rule entirely
   with the ``Disable this rule`` action. Disabling the rule affects it in all
   rulesets.

After tuning a rule, the rulesets using that rule must be recompiled at
``Service Control`` > ``Sigma`` > ``Rulesets``.
       
Adding Custom Rules
~~~~~~~~~~~~~~~~~~~

Custom rules can be added using the Sigma format according to the
`specification <https://github.com/SigmaHQ/sigma/wiki/Specification>`_. You can
upload single files or a ZIP compressed archive. This can be done at
``Service Control`` > ``Sigma`` > ``Rules`` > ``Upload Rules``.

    .. figure:: ../images/sc_custom-rule.png
       :alt: Adding Custom Rules
    
       Adding Custom Rules

Rule and Response Updates
~~~~~~~~~~~~~~~~~~~~~~~~~

If new rules or rule updates are provided by the Aurora signatures, the user
must apply the updates manually before they affect Aurora agents managed by
the Management Center. An indicator is shown in the Web UI, and rule changes
can be reviewed and applied at ``Service Control`` > ``Sigma`` >
``Rule Updates``.

    .. figure:: ../images/sc_update-sigma-rules.png
       :alt: Sigma Rule Updates for Aurora
    
       Sigma Rule Updates for Aurora

Clicking the ``Update`` button in the "Update Available" column opens a diff
view that shows the changes and allows the user to apply or discard them. If
you do not need to review each individual change, you can apply all
changes using the ``Update All Rules`` button.

Response action updates can be viewed and applied at
``Service Control`` > ``Sigma`` > ``Response Updates``.

How to Activate Responses
~~~~~~~~~~~~~~~~~~~~~~~~~
As a fail-safe and for administration purposes, responses are generally
only simulated if not explicitly set to active.
This must be done at different levels:

- Service configuration level
- Ruleset configuration level (on updates)
- Ruleset rule level

If a rule is simulated at any level, it does not execute the response
actions. It only generates a log line that describes the action that would
have been performed. You can see an overview of the state of all
responses in the ``Service Control`` > ``Aurora`` > ``Configurations`` menu.


    .. figure:: ../images/sc_aurora-configuration-response-overview.png
       :alt: Aurora Configuration Response Action Overview
    
       Aurora Configuration Response Action Overview

(1) indicates whether responses are activated at the configuration level. Edit the configuration to change it.
(2) indicates how many rules are simulated in that ruleset, or in total.
(3) indicates how many rules have active responses in that ruleset, or in total.

To change the status of a response in the ruleset, click the ruleset link.
You can view all simulated or all active responses. Use the checkbox and
the button in the upper-right corner to switch the response status of the rules
between active and simulated.

    .. figure:: ../images/sc_aurora-ruleset-responses.png
       :alt: Response Configuration in Rulesets
    
       Response Configuration in Rulesets

The default response mode of a ruleset is important for the
behavior of response updates. It can be seen at ``Service Control`` >
``Sigma`` > ``Rulesets`` in the ``Default Response Mode`` column.

    .. figure:: ../images/sc_sigma-ruleset-default-response-mode.png
       :alt: Ruleset Default Response Mode
    
       Ruleset Default Response Mode

If "Simulation" is selected, response actions of new and updated rules are
put in simulation mode. If "Active" is selected, new rules are automatically
put in active mode and updated rules do not change their current response
mode. We recommend leaving the default response mode set to "Simulation".
