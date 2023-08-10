# About
This repository contains the full configuration for quickly setting up a TIG (Telegraf, InfluxDB, Grafana) stack and collecting QOS interface statitics on IOS XR routers.

More information can be found on [XRdocs](https://xrdocs.io/telemetry/tutorials/telemetry-stack-update-qos-interface-statistics-example/). 

# Usage
1. Clone this repository `git clone https://github.com/RomainCyr/tig-stack-qos-interface-statistics.git`
2. Update the docker compose file to use either the `telegraf_dial_out.conf` or `telegraf_dial_in.conf` configuration file
4. If you are using the dial_in collection methods, update the `addresses` attribute of the `inputs.gnmi` plugin in the `telegraf_dial_in.conf` file
3. Launch the docker compose `docker compose up -d`
If you have issues reaching the collector, the InfluxDB or the Grafana web UI, check your firewall or iptables rules