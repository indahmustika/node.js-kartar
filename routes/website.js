var express = require('express');
var router 	= express.Router();
var conn	= require('../koneksi/conn_website.js');

router.get('/',function(req, res, next){
	var sql = "SELECT id_berita, judul_berita, muatan_berita, gambar_berita, DATE_FORMAT(date_created, '%d %b, %Y') AS date_created, user_created FROM berita ORDER BY id_berita DESC LIMIT 5";
	conn.query(sql, function (err,result){
		if(err){
			throw err;
		} else{
			var sql1 = "SELECT id_foto, judul_foto, file_foto, DATE_FORMAT(date_created, '%a, %d %b %Y') AS date_created, user_created FROM galeri ORDER BY id_foto DESC LIMIT 1";
			conn.query(sql1, function (err1,result1){
				if(err1){
					throw err;
				} else{
					var sql2 = "SELECT id_foto, judul_foto, file_foto, DATE_FORMAT(date_created, '%a, %d %b %Y') AS date_created, user_created FROM galeri WHERE id_foto NOT IN (SELECT MAX(id_foto) FROM galeri) ORDER BY id_foto DESC";
					conn.query(sql2, function (err2,result2){
						if(err2){
							throw err;
						} else{
							var sql3 = "SELECT id_pengumuman, judul_pengumuman, muatan_pengumuman, gambar_pengumuman, DATE_FORMAT(date_created, '%d %b, %Y') AS tanggal, user_created FROM pengumuman ORDER BY id_pengumuman DESC LIMIT 3";
							conn.query(sql3, function (err3,result3){
								if(err3){
									throw err;
								} else{
									var sql4 = "SELECT id_agenda, judul_agenda, DATE_FORMAT(waktu_agenda, '%a, %d %b %Y') as waktu_agenda, muatan_agenda, gambar_agenda, DATE_FORMAT(date_created, '%a, %d %b %Y') AS date_created, user_created FROM agenda ORDER BY id_agenda DESC LIMIT 3";
									conn.query(sql4, function (err4,result4){
										if(err4){
											throw err;
										} else{
											res.render('website_index',{berita:result, galeriutama:result1, galeri: result2, pengumuman: result3, agenda: result4});
										}
									});
								}
							});
						}
					});
				}
			});
		}
	});
});
module.exports = router;
