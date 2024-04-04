FROM vpetcu1/ldme-mate-base:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

RUN add-apt-repository universe
RUN apt-get update && apt-get install sshuttle iputils-ping telnet libncurses5 -y
