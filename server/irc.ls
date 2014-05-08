require! irc

connect = (server, nick, options, on-msg) ->
	client = new irc.Client server, nick, options
	client.addListener \message, on-msg

module.exports.connect = connect