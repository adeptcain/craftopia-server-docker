#! /bin/sh

if [ ! -f /opt/craftopia/ServerSetting.ini ]; then
  steamcmd +force_install_dir /opt/craftopia +login anonymous +app_update 1670340 +quit

  cp /opt/ServerSetting.ini /opt/craftopia/ServerSetting.ini
  sed -i -e "s/name=NoName/name=$WORLD_NAME/g" \
  -e "s/difficulty=1/difficulty=$WORLD_DIFFICULTY/g" \
  -e "s/gameMode=1/gameMode=$WORLD_GAME_MODE/g" \
  -e "s/port=6587/port=$HOST_PORT/g" \
  -e "s/maxPlayerNumber=7/maxPlayerNumber=$HOST_MAX_PLAYER_NUMBER/g" \
  -e "s/usePassword=0/usePassword=$HOST_USE_PASSWORD/g" \
  -e "s/serverPassword=00000000/serverPassword=$HOST_SERVER_PASSWORD/g" \
  -e "s/autoSaveSec=300/autoSaveSec=$SAVE_AUTO_SAVE_SEC/g" \
  -e "s/autoSavePerHour=1/autoSavePerHour=$SAVE_AUTO_SAVE_PER_HOUR/g" /opt/craftopia/ServerSetting.ini
fi

if [ "$FORCE_UPDATE" = "true" ]; then
  steamcmd +force_install_dir /opt/craftopia +login anonymous +app_update 1670340 +quit
fi

cd /opt/craftopia
./Craftopia.x86_64
