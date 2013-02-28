md = require("node-markdown").Markdown
fs = require("fs")

exports.index = (req, res) ->
  res.writeHead(200, { 'Content-Type': 'text/html' })
  markdown = fs.readFileSync(__dirname + "/../../README.md", 'utf8')
  res.end md(markdown)
