exports.extractPort = (req, res, next)->
	reg   = /:(\d+)/
	match = req.headers.host.match reg

	if match
		req.port = parseInt match[1]
	else
		req.port = 80

	next()

exports.herokuSSL = (req, res, next)->
	req.secure = req.secure or req.headers['x-forwarded-proto'] is 'https'
	next()

exports.ssl = (req, res, next)->
	if req.secure
		next()
	else
		url  = "https://#{req.host}"
		url += ":#{req.port}" unless req.port is 80
		url += req.originalUrl
		console.log "Redirecting to #{url}"
		res.redirect url

