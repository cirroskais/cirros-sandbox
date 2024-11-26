# Change ownership of everything to gmod
chown gmod:gmod -R /home/gmod

# Install/Update Garry's Mod Dedicated Server
su gmod -c "./steamcmd/steamcmd.sh +force_install_dir /home/gmod/server +login anonymous +app_update 4020 +quit"

# Start the damn thing
su gmod -c "./server/srcds_run -game garrysmod -console +maxplayers $MAXPLAYERS +gamemode sandbox +map $MAP +sv_setsteamaccount $GSLT $ARGS"