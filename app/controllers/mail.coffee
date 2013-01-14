email  = require 'emailjs/email'
assert = require 'assert'

exports.index = (req, res)->
	res.render 'mail/index'

exports.send = (req, res)->
	server = email.server.connect
		user: req.body.from.user
		password: req.body.from.password
		host: req.body.from.host
		ssl: if req.body.from.ssl is 'on' then on else off

	message =
		text: req.body.body.text
		from: req.body.from.address
		to: req.body.to
		subject: req.body.subject
		attachment: [
			{
				data: req.body.body.html
				alternative: yes
			}
		]

	server.send message, (err, message)->
		assert.ifError err
		res.redirect 'back'

