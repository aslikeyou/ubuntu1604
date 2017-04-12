
sudo wget http://teamcity.pdffiller.com/update/buildAgent.zip -P /opt
sudo unzip /opt/buildAgent.zip -d /opt/buildAgent
# http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html
SERVER_IP="$(curl http://169.254.169.254/latest/meta-data/public-ipv4)"
read -p "Enter the name for teamcity agent:" agentName

cp ./buildAgent.properties.template ./buildAgent.properties
sed -i "s/ownAddress=<ownAddress>/ownAddress=${SERVER_IP}/g" ./buildAgent.properties
sed -i "s/name=<name>/name=${agentName}/g" ./buildAgent.properties
sudo mv ./buildAgent.properties /opt/buildAgent/conf/buildAgent.properties
sudo sh /opt/buildAgent/bin/agent.sh start
