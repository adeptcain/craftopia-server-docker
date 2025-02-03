FROM steamcmd/steamcmd:latest

LABEL version="v1.0.0"

VOLUME [ "/opt/craftopia" ]

COPY [ "ServerSetting.ini", "startupScript.sh", "/opt/" ]

RUN [ "apt", "update" ]
RUN [ "apt", "install", "sqlite3", "-y" ]

ENV WORLD_NAME="world" WORLD_DIFFICULTY=1 WORLD_GAME_MODE=1 HOST_PORT=6587
ENV HOST_MAX_PLAYER_NUMBER=32 HOST_USE_PASSWORD=0 HOST_SERVER_PASSWORD=00000000
ENV SAVE_AUTO_SAVE_SEC=300 SAVE_AUTO_SAVE_PER_HOUR=1 FORCE_UPDATE=true

ENTRYPOINT [ "sh", "/opt/startupScript.sh" ]
