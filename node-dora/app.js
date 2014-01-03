var express = require("express");
var app = express();

app.get("/", function(req, res){
  res.send("Hello world!");	
});

app.listen(process.env.VCAP_APP_PORT || 3013);
console.log('Express server started');