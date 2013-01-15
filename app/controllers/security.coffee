exports.extractPort = (req, res, next)->
	port  = 80
	reg   = /:(\d+)/
	match = req.headers.host.match reg

	if match
		req.port = parseInt match[1]

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

