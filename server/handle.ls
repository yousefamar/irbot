require! <[ ./irc.ls ]>

log = console.log

handlers =
  join: (name, callback) !->
    log "Joining IRC server"
    irc.connect \chat.freenode.net \botsef {channels: [\#irbot]}, (from, to, msg) ->
      callback "#from => #to: #msg"

handle = (data, callback) ->
  data .= trim!
  if data[0] is \!
    data .= split ' '
    data.push callback
    handlers[data[0].substring 1]? .apply handlers, data.slice 1

  log data

module.exports = handle