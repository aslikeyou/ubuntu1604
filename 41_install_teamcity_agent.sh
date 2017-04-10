
sudo wget http://teamcity.pdffiller.com/update/buildAgent.zip -P /opt
sudo unzip /opt/buildAgent.zip -d /opt/buildAgent
SERVER_IP="$(/bin/hostname -i)"
read -p "Enter the name for teamcity agent:" agentName

cp ./buildAgent.properties.template ./buildAgent.properties
sed -i "s/ownAddress=<ownAddress>/ownAddress=${SERVER_IP}/g" ./buildAgent.properties
sed -i "s/name=<name>/name=${agentName}/g" ./buildAgent.properties
sudo mv ./buildAgent.properties /opt/buildAgent/conf/buildAgent.properties
