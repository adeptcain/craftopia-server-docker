#! /bin/bash

if [ ! -f /opt/craftopia/ServerSetting.ini ]; then
  steamcmd +login anonymous +force_install_dir /opt/craftopia +app_update 1670340 +quit

  cp /opt/ServerSetting.ini /opt/craftopia/ServerSetting.ini
  sed -i "s/name=NoName/name=$WORLD_NAME/g" /opt/ServerSetting.ini
  sed -i "s/difficulty=1/difficulty=$WORLD_DIFFICULTY/g" /opt/ServerSetting.ini
  sed -i "s/gameMode=1/gameMode=$WORLD_GAME_MODE/g" /opt/ServerSetting.ini
  sed -i "s/port=6587/port=$HOST_PORT/g" /opt/ServerSetting.ini
  sed -i "s/maxPlayerNumber=7/maxPlayerNumber=$HOST_MAX_PLAYER_NUMBER/g" /opt/ServerSetting.ini
  sed -i "s/usePassword=0/usePassword=$HOST_USE_PASSWORD/g" /opt/ServerSetting.ini
  sed -i "s/serverPassword=00000000/serverPassword=$HOST_SERVER_PASSWORD/g" /opt/ServerSetting.ini
  sed -i "s/autoSaveSec=300/autoSaveSec=$SAVE_AUTO_SAVE_SEC/g" /opt/ServerSetting.ini
  sed -i "s/autoSavePerHour=1/autoSavePerHour=$SAVE_AUTO_SAVE_PER_HOUR/g" /opt/ServerSetting.ini
fi

if [ "$FORCE_UPDATE" == "true" ]; then
  steamcmd +login anonymous +force_install_dir /opt/craftopia +app_update 1670340 +quit
fi

cd /opt/craftopia
./Craftopia.x86_64