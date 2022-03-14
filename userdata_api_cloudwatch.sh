#!/bin/bash
sudo yum install amazon-cloudwatch-agent -y

sudo wget -L https://raw.githubusercontent.com/JeremyKuah/SmartBank_UserData/main/amazon-cloudwatch-agent.json
sudo chmod 777 amazon-cloudwatch-agent.json
sudo mv amazon-cloudwatch-agent.json /opt/aws/amazon-cloudwatch-agent/etc/

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
sudo /bin/systemctl start amazon-cloudwatch-agent

sudo mkdir /home/ec2-user/api
sudo chmod 777 /home/ec2-user/api

sudo yum update -y
sudo yum install java -y

sudo cd /
sudo wget -L https://github.com/JeremyKuah/SmartBankAPI_JarRepo/raw/main/smart-bank-api.jar

sudo java -Dserver.port=80 -Dspring.datasource.url=jdbc:postgresql://${db_endpoint}/${db_name} -Dmailman.endpoint=http://${mailman_endpoint} -Dserver.servlet.context-path=/api -jar smart-bank-api.jar --logging.file=/home/ec2-user/api/service.log &
