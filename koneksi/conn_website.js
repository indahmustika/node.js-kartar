var mysql = require('mysql');
var conn = mysql.createConnection({
	host:"localhost",
	user:"root",
	password:"",
	database:"kartar"
});

conn.connect(err=>{
	if(err) throw err;
	console.log("connect");
});
module.exports = conn;