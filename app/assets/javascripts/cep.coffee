###request = require 'request'

resp = ""
request.get {uri:'https://viacep.com.br/ws/38060510/json/', json : true}, (err, r, body) ->
  resp = body
  console.log "BODY: " + resp###