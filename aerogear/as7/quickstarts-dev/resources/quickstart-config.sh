# Color functions
blue(){
  printf "\e[38;05;4m $1"
  tput sgr0
}
red(){
  printf "\e[38;05;160m $1"
  tput sgr0
}
yellow(){
  printf "\e[38;05;136m $1"
  tput sgr0
}
green(){
  printf "\e[38;05;100m $1"
  tput sgr0
}


launch() {
  if [ -d $HOME/$REPO_NAME ] && [ -f $HOME/quickstarts-config.json ];then
    green "We are about to download the whole internet, be patient\n" | cowsay
    cd $HOME/$REPO_NAME && mvn -s quickstart-settings.xml clean install -DskipTests=true
  fi
  /opt/aerogear/server/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
}

# Configuration menu
config(){
  green "=========================================================================\n"
  green  "Quickstarts initial configuration\n"
  green "=========================================================================\n"
  blue ">>> UnifiedPush server URL: "
  read URL
  blue ">>> Push application ID: "
  read APPLICATION_ID
  blue ">>> Master Secret: "
  read MASTER_SECRET

  if [ -z $URL ] && [ -z $APPLICATION_ID ] && [ -z $MASTER_SECRET ]; then
    clear
    red "I would love if you configure the quickstarts, otherwise I won't be able to help you\n" | cowsay
    config
  else
    printf '{"url":"%s","applicationId":"%s","masterSecret":"%s"}\n' "$URL" "$APPLICATION_ID" "$MASTER_SECRET" > $HOME/$REPO_NAME/server/contacts-mobile-picketlink-secured/src/main/resources/META-INF/quickstarts-config.json
    launch
    exit 0
  fi
}

config


