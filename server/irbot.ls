#!/usr/bin/env node_modules/LiveScript/bin/lsc

require! <[ fs http open shoe ]>
ecstatic = (require \ecstatic) "client"

port = 8080

server = http.create-server ecstatic
  ..listen port

#sock = shoe (stream) ->
#  process.stdin .pipe split! .pipe stream
#sock.install server, \/racedata

open "http://localhost:#port/index.html"