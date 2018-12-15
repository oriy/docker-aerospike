FROM aerospike/aerospike-server

ENV AEROSPIKE_MANAGEMENT_CONSOLE_VERSION 4.0.20

RUN \
  apt-get update -y \
  && apt-get install -y wget python python-dev gcc\
  && wget "https://www.aerospike.com/download/amc/${AEROSPIKE_MANAGEMENT_CONSOLE_VERSION}/artifact/ubuntu12" -O aerospike-amc.deb \
  && dpkg -i aerospike-amc.deb

COPY ./amc_entrypoint.sh /amc_entrypoint.sh
COPY ./register.sh /register.sh
COPY ./aerospike.conf /opt/aerospike/etc/aerospike.conf
COPY ./amc.conf /etc/amc/amc.conf

VOLUME ["/aerospike-udf"]

ENTRYPOINT ["/amc_entrypoint.sh"]
CMD ["asd", "--config-file", "/opt/aerospike/etc/aerospike.conf"]

EXPOSE 13000