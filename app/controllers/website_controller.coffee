md = require("node-markdown").Markdown
fs = require("fs")

exports.index = (req, res) ->
  res.writeHead(200, { 'Content-Type': 'text/html' })
  html = fs.readFileSync(__dirname + "/../../public/index.html", 'utf8')
  res.end html
