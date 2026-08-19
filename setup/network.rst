.. index:: Network Configuration

Network Configuration
---------------------

.. figure:: ../images/setup_network1.png
   :alt: Configure the network

.. figure:: ../images/setup_network2.png
   :alt: Configure the network

.. figure:: ../images/setup_network3.png
   :alt: Configure the network

.. figure:: ../images/setup_network4.png
   :alt: Configure the network

.. warning::
   The Management Center needs to be able to resolve internal and external
   IP addresses.

.. figure:: ../images/setup_network5.png
   :alt: Configure the network

.. figure:: ../images/setup_network6.png
   :alt: Configure the network

.. important::
   Make sure that the combination of hostname and domain creates an FQDN
   that can be resolved from the endpoints on which you intend to install
   the Endpoint Agents. If the configured FQDN (hostname + domain) cannot be
   resolved on the endpoints, agents cannot find and connect to the
   Management Center.

   This is especially important because your Management Center creates
   certificates during installation. These certificates contain the FQDN as
   the Subject Alternative Name (SAN), not the IP address. You cannot connect
   Management Center to your Analysis Cockpit by IP address.

.. figure:: ../images/setup_network7.png
   :alt: Configure the network
