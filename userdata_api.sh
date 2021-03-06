#!/bin/bash
sudo yum update -y
sudo yum install java -y

sudo wget -L https://github.com/JeremyKuah/SmartBankAPI_JarRepo/raw/main/smart-bank-api.jar

sudo java -Dserver.port=80 -Dspring.datasource.url=jdbc:postgresql://${db_endpoint}/${db_name} -Dmailman.endpoint=http://${mailman_endpoint} -Dserver.servlet.context-path=/api -jar smart-bank-api.jar &
