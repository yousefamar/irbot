window.IRBOT =

  join: ->
    div = document.createElement \div
      ..id = \roomlog

    @send "!join #it"

    document.body.appendChild div

window.IRBOT.main = do

  shoe = require \shoe
  through = require \through

  handlers =
    server-dc: ->
      console.log "Server DC'd"
      window.close!
    log: ->
      console.log it.text

  ->
    stream = shoe \/irbot
    stream.pipe through (msg) ->
      msg = JSON.parse msg
      handlers[msg.event]? msg
    delete window.IRBOT.main
    window.IRBOT.send = ->
      stream.write it
