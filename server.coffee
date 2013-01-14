app    = require './app'
http   = require 'http'
port   = app.get 'port'
server = http.createServer app

server.listen port, ->
	console.log "Express server listening on port #{port}"

