Adapter = require('hubot').adapter()
Robot = require('hubot').robot()

Parser = require('./parser').Parser
Packet = require('./packet').Packet
Client = require('./client').Client

class Minecraft extends Adapter
  send: (user, strings...) ->
    strings.forEach (str) => @bot.say(str)


  reply: (user, strings...) ->
    strings.map((str) -> "#{user.name}: #{str}").forEach (str) =>
      @bot.say(str)

  run: ->
    self = @

    port = parseInt(process.env.HUBOT_MINECRAFT_PORT, 10)
    host = process.env.HUBOT_MINECRAFT_HOST
    username = process.env.HUBOT_MINECRAFT_USERNAME
    password = process.env.HUBOT_MINECRAFT_PASSWORD

    bot = new Client(port, host, username, password)
    @bot = bot

    # Hack to get around NPM loading in multiple copies of Robot and instanceof failing to match up.
    r = @robot.constructor

    bot.on 'end', -> process.exit()

    bot.on 'chat', (str) ->
      userChatMatch = str.match(/^<(\w{1,16})>\s(.*)$/)
      if userChatMatch?
        [_, username, msg] = userChatMatch
        user = self.userForId(username)
        self.receive new r.TextMessage(user, msg)

      joinedMatch = str.match(/^§e(\w{1,16}) joined the game.$/)
      if joinedMatch?
        user = self.userForId(joinedMatch[1])
        self.receive(new r.EnterMessage(user))

      leftMatch = str.match(/^§e(\w{1,16}) left the game.$/)
      if leftMatch?
        user = self.userForId(leftMatch[1])
        self.receive(new r.LeaveMessage(user))

  userForUsername: (username) ->
    @userForName(username) or new User(username)

exports.use = (robot) ->
  new Minecraft robot
