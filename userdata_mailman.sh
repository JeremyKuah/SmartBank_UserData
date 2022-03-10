#!/bin/bash
sudo yum update -y
sudo yum install java -y

sudo wget -L https://github.com/JeremyKuah/SmartBankMailman_JarRepo/raw/main/smart-bank-mailman.jar

sudo java -Dserver.port=80 -jar smart-bank-mailman.jar &