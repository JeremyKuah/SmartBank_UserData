#!/bin/bash
sudo yum update -y
sudo yum install java -y

sudo wget -L https://github.com/JeremyKuah/SmartBankAPI_JarRepo/raw/main/smart-bank-api.jar

sudo java -Dserver.port=80 -Dspring.datasource.url=jdbc:postgresql://${db_endpoint}/${db_name} -jar smart-bank-api.jar &