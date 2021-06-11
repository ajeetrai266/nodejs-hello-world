var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('hello world');
}).listen(80, "0.0.0.0");
console.log('Server running at http://127.0.0.1:80/');
