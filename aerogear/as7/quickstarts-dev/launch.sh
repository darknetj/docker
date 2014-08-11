#!/bin/sh

launch() {
  if [ -d $HOME/$REPO_NAME ] && [ -f $HOME/$REPO_NAME/server/contacts-mobile-picketlink-secured/src/main/resources/META-INF/quickstarts-config.json ];then
    echo "We are about to download the whole internet, be patient" | cowsay
    #cd $HOME/$REPO_NAME && mvn -s quickstart-settings.xml clean install -DskipTests=true
    mvn -s quickstart-settings.xml clean install -DskipTests=true
    cp $HOME/$REPO_NAME/server/contacts-mobile-picketlink-secured/target/jboss-contacts-mobile-picketlink-secured.war $JBOSS_HOME/standalone/deployments/
  fi
  /opt/aerogear/server/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0;bash
}

if [ ! -z "$CONFIG" ]; then
  cd $HOME/$REPO_NAME && git checkout origin/jboss-as7
  echo $CONFIG | tee $HOME/$REPO_NAME/server/contacts-mobile-picketlink-secured/src/main/resources/META-INF/quickstarts-config.json
  launch
fi



