aerospike-server+
=================

Extension for the official Aerospike image [aerospike/aerospike-server](https://hub.docker.com/_/aerospike)

Docker container starts **Aerospike Management Console** as a service

Aerospike Management Console (AMC) is a web-based tool to monitor/manage an Aerospike cluster

Docker image includes local **aerospike.conf** and **amc.conf**, both are used as configurations for ASD and AMC

In addition to ports **3000-3003**, port **13000** (AMC web) is also exposed

```bash
docker run -d --name aerospike --volume <path-to-local-udf-folder>:/aerospike-udf -p 3000:3000 -p 3001:3001 -p 3002:3002 -p 3003:3003 -p 13000:13000 aerospike
```
* note that config parameter is omitted

**/register.sh** enables registration of **User Defined Functions**, UDF files must be available on all nodes, therefore 
**/aerospike-udf** folder is defined as docker volume

```bash
docker exec aerospike /register.sh
```
