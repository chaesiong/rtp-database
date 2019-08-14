#!/bin/bash
# There are some commonly spread grants that makes it impossible to diff sources. Use the following command to eliminate them before diff'ing:
find . -type f -exec sed -i '/CREATE UNIQUE INDEX.*SYS_.*/d; /GRANT.*PIBICSDM2.*$/d; /GRANT.*APPSUP.*$/d; /GRANT.*TESTADM.*$/d; /GRANT.*TRAINEE.*$/d; /GRANT.*PIBICSAPP.*$/d; /GRANT.*DERMALOG_PROXY.*$/d; /GRANT.*SERVAPP.*$/d; /GRANT.*BIO_BD.*$/d;' "{}" \;
