#!/usr/bin/env bash

# FileBeat installation
#sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
#sudo apt-get install -y apt-transport-https
#echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
#sudo apt-get update && sudo apt-get install filebeat

# Configuration
APP_LOGS_DEFAULT='/var/www/pdffiller/logs/json-fb';
APP_ENV_DEFAULT='prod';
BEAT_NAME_DEFAULT='web';

if [ "$1" != "-f" ]
    then
    read -p "Application logs directory (optional, default - $APP_LOGS_DEFAULT): " LOGS_PATH
    read -p "Application environment (optional, default - $APP_ENV_DEFAULT): " APP_ENV
    read -p "Logs name (optional, default - $BEAT_NAME_DEFAULT): " BEAT_NAME
fi;

read -p "ElasticSearch hosts (required, enter values with a space): " -a ES_HOSTS

for a in ${ES_HOSTS[@]}
do
    if [ $ES_HOSTS_STRING ]
        then ES_HOSTS_STRING="$ES_HOSTS_STRING, \"$a\"";
        else ES_HOSTS_STRING="\"$a\""
    fi
done

if [ ! $LOGS_PATH ]
    then LOGS_PATH=$APP_LOGS_DEFAULT;
fi;

if [ ! $APP_ENV ]
    then APP_ENV=$APP_ENV_DEFAULT;
fi;

if [ ! $BEAT_NAME ]
    then BEAT_NAME=$BEAT_NAME_DEFAULT;
fi;

sed \
    -e "s@{LOGS_DIRECTORY}@$LOGS_PATH@g" \
    -e "s@{APP_ENV}@$APP_ENV@g" \
    -e "s@{BEAT_NAME}@$BEAT_NAME@g" \
    -e "s@{ES_HOSTS}@$ES_HOSTS_STRING@g" \
    ./filebeat/filebeat.template.yml > ./filebeat/filebeat.yml

#sudo cp -rf filebeat /etc/
#sudo update-rc.d filebeat defaults 95 10
