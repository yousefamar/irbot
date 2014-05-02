window.IRBOT = {}

window.IRBOT.main = do

  shoe = require 'shoe'
  through = require 'through'

  handlers =
    server-dc: ->
      console.log "Server DC'd"

  ->
    shoe '/irbot' .pipe through (data) ->
      data = JSON.parse data
      handlers[data.event]? data