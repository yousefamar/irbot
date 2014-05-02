#!/usr/bin/env node_modules/LiveScript/bin/lsc

require! <[ fs http open shoe ]>
ecstatic = (require \ecstatic) "client"

log = console.log
err = console.err

portID = (process.argv.indexOf '-p') + 1
port = if portID then Number.parseInt process.argv[portID] else 8080

server = http.create-server ecstatic
  ..listen port

if '--gui' in process.argv
  streams = []

  sock = shoe (stream) ->
    streams.push(stream)
    log "stream created"

    stream.on \end, !-> delete streams[streams.indexOf(stream)]
  sock.install server, \/irbot

  process.on \SIGINT, !->
    streams.forEach !-> it.write JSON.stringify {event: \serverDc}
    process.exit!

  open "http://localhost:#port/index.html"