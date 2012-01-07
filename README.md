# hubot-minecraft

by [Chris Lloyd](http://github.com/chrislloyd) @ [Minefold](https://minefold.com)

This adapter will connect your Hubot instance to a Mincraft server. You'll need a seperate paid Minecraft account to connect.

This adapter is **BETA**. It contains what we think is a pretty complete implementation of the Minecraft protocol, but there are definitely cases that it can't handle.

![Marvin](http://f.cl.ly/items/3v47303S1W2O2Z1V060Q/Screen%20Shot%202012-01-06%20at%204.53.57%20PM.png)

or check out a [quick video](http://www.youtube.com/watch?v=-XWtZmYtQcE) of it in action.

## Configuring the Adapter

The Minecraft adapter requires the following environment variables.

* `HUBOT_MINECRAFT_HOST`
* `HUBOT_MINECRAFT_PORT`
* `HUBOT_MINECRAFT_USERNAME`
* `HUBOT_MINECRAFT_PASSWORD`

### Minecraft Host

This is your Minecraft server's host. It'll will look something like `pluto.minefold.com`.

### Minecraft Port

This is the port your Minecraft server is running on. By default, Minecraft runs on port `25565`.

### Minecraft Username

This is the username of a paid Minecraft account.

### Minecraft Password

This is the Minecraft account's password.

### Configuring the variables on Heroku

    % heroku config:add HUBOT_MINECRAFT_HOST="..."
    % heroku config:add HUBOT_MINECRAFT_PORT="..."
    % heroku config:add HUBOT_MINECRAFT_USERNAME="..."
    % heroku config:add HUBOT_MINECRAFT_PASSWORD="..."

### Configuring the variables on UNIX

    % export HUBOT_MINECRAFT_HOST="..."
    % export HUBOT_MINECRAFT_PORT="..."
    % export HUBOT_MINECRAFT_USERNAME="..."
    % export HUBOT_MINECRAFT_PASSWORD="..."
