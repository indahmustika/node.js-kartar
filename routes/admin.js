var express = require('express');
var session = require('express-session');
var router	= express.Router();
var conn	= require('../koneksi/conn_website.js');

router.get('/login',function(req, res, next){
	res.render('admin_login');
});

router.post('/login_check',function(req, res, next){
	let username_admin 	= req.param('username_admin');
	let password_admin 	= req.param('password_admin');
	var sql = "SELECT * FROM admin WHERE username_admin = '"+username_admin+"' AND password_admin = '"+password_admin+"'";
	conn.query(sql,(err,result)=>{
		if(result.length > 0){
			req.session.loggedin = true;
			req.session.user = username_admin;
			req.session.username = result[0].nama_admin;
			res.redirect('/admin/beranda');
		} else{
			res.redirect('/admin/login')
		}
	});
});

router.get('/logout',function(req, res, next){
	req.session.destroy(function(err) {
	});
	res.redirect('/admin/login');
});

router.get('/beranda',function(req, res, next){
	if(req.session.loggedin){
		res.render('admin_index');
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/berita',function(req, res, next){
	if(req.session.loggedin){
		var sql = "SELECT id_berita, judul_berita, muatan_berita, gambar_berita, DATE_FORMAT(date_created, '%d %b %Y %T') AS date_created, user_created FROM berita ORDER BY id_berita DESC";
		conn.query(sql,(err,result)=>{
			res.render('admin_berita',{berita:result});
		});	
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/tambah_berita',function(req, res, next){
	if(req.session.loggedin){
		res.render('admin_berita_insert');
	} else{
		res.redirect('/admin/login');
	}
});

router.post('/insert', function(req, res, next){
	if(req.session.loggedin){
		let judul_berita	= req.param('judul_berita');
		let muatan_berita	= req.param('muatan_berita');
		let gambar_berita	= req.param('gambar_berita');
		let username 		= req.session.user;
		var sql = "INSERT INTO berita (id_berita, judul_berita, muatan_berita, gambar_berita, date_created, user_created) VALUES (NULL, '"+judul_berita+"', '"+muatan_berita+"', '"+gambar_berita+"', CURRENT_TIMESTAMP, '"+username+"')";
		conn.query(sql,(err,result)=>{
			res.redirect('/admin/berita')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/edit_berita/:id_berita', function(req, res, next){
	if(req.session.loggedin){
		let id_berita = req.params.id_berita;
		var sql = "SELECT * FROM berita WHERE id_berita = '"+id_berita+"'";
		conn.query(sql,(err,result)=>{
			res.render('admin_berita_update',{berita:result});
		});	
	} else{
		res.redirect('/admin/login');
	}
});

router.post('/update', function(req, res, next){
	if(req.session.loggedin){
		let id_berita		= req.param('id_berita');
		let judul_berita	= req.param('judul_berita');
		let muatan_berita	= req.param('muatan_berita');
		let gambar_berita	= req.param('gambar_berita');
		var sql = "UPDATE berita SET judul_berita = '"+judul_berita+"', muatan_berita = '"+muatan_berita+"', gambar_berita = '"+gambar_berita+"' WHERE id_berita = '"+id_berita+"'";
		conn.query(sql,(err,result)=>{
			res.redirect('/admin/berita')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/delete/:id_berita', function(req, res, next){
	if(req.session.loggedin){
		let id_berita = req.params.id_berita;
		var sql = "DELETE FROM berita WHERE id_berita = '"+id_berita+"'";
		conn.query(sql, function(err,result){
			if(err) throw err;
			res.redirect('/admin/berita')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/agenda', function(req, res, next){
	if(req.session.loggedin){
		var sql = "SELECT id_agenda, judul_agenda, DATE_FORMAT(waktu_agenda, '%a, %d %b %Y') AS waktu_agenda, muatan_agenda, gambar_agenda, DATE_FORMAT(date_created, '%d %b %Y %T') AS date_created, user_created FROM agenda ORDER BY id_agenda DESC";
		conn.query(sql,(err,result)=>{
			res.render('admin_agenda',{agenda:result});
		}); 
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/tambah_agenda',function(req, res, next){
	if(req.session.loggedin){
		res.render('admin_agenda_insert');
	} else{
		res.redirect('/admin/login');
	}	
});

router.post('/insert_agenda', function(req, res, next){
	if(req.session.loggedin){
		let judul_agenda	= req.param('judul_agenda');
		let waktu_agenda	= req.param('waktu_agenda');
		let muatan_agenda	= req.param('muatan_agenda');
		let gambar_agenda	= req.param('gambar_agenda');
		let username 		= req.session.user;
		var sql = "INSERT INTO agenda (id_agenda, judul_agenda, waktu_agenda, muatan_agenda, gambar_agenda, date_created, user_created) VALUES (NULL, '"+judul_agenda+"', '"+waktu_agenda+"', '"+muatan_agenda+"', '"+gambar_agenda+"', CURRENT_TIMESTAMP, '"+username+"')";
		conn.query(sql,(err,result)=>{
			res.redirect('/admin/agenda')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/edit_agenda/:id_agenda', function(req, res, next){
	if(req.session.loggedin){
		let id_agenda = req.params.id_agenda;
		var sql = "SELECT id_agenda, judul_agenda, DATE_FORMAT(waktu_agenda, '%Y-%m-%d') AS waktu_agenda, muatan_agenda, gambar_agenda, DATE_FORMAT(date_created, '%d %b %Y %T') AS date_created, user_created FROM agenda WHERE id_agenda = '"+id_agenda+"'";
		conn.query(sql,(err,result)=>{
			res.render('admin_agenda_update',{agenda:result});
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.post('/update_agenda', function(req, res, next){
	if(req.session.loggedin){
		let id_agenda		= req.param('id_agenda');
		let judul_agenda	= req.param('judul_agenda');
		let waktu_agenda	= req.param('waktu_agenda');
		let muatan_agenda	= req.param('muatan_agenda');
		let gambar_agenda	= req.param('gambar_agenda');
		var sql = "UPDATE agenda SET judul_agenda = '"+judul_agenda+"', waktu_agenda = '"+waktu_agenda+"', muatan_agenda = '"+muatan_agenda+"', gambar_agenda = '"+gambar_agenda+"' WHERE id_agenda = '"+id_agenda+"'";
		conn.query(sql,(err,result)=>{
			res.redirect('/admin/agenda')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/delete_agenda/:id_agenda', function(req, res, next){
	if(req.session.loggedin){
		let id_agenda = req.params.id_agenda;
		var sql = "DELETE FROM agenda WHERE id_agenda = '"+id_agenda+"'";
		conn.query(sql, function(err,result){
			if(err) throw err;
			res.redirect('/admin/agenda')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/pengumuman',function(req, res, next){
	if(req.session.loggedin){
		var sql = "SELECT id_pengumuman, judul_pengumuman, muatan_pengumuman, gambar_pengumuman, DATE_FORMAT(date_created, '%d %b %Y %T') AS date_created, user_created FROM pengumuman ORDER BY id_pengumuman DESC";
		conn.query(sql,(err,result)=>{
			res.render('admin_pengumuman',{pengumuman:result});
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/tambah_pengumuman',function(req, res, next){
	if(req.session.loggedin){
		res.render('admin_pengumuman_insert');
	} else{
		res.redirect('/admin/login');
	}
});

router.post('/insert_pengumuman', function(req, res, next){
	if(req.session.loggedin){
		let judul_pengumuman	= req.param('judul_pengumuman');
		let muatan_pengumuman	= req.param('muatan_pengumuman');
		let gambar_pengumuman	= req.param('gambar_pengumuman');
		let username 			= req.session.user;
		var sql = "INSERT INTO pengumuman (id_pengumuman, judul_pengumuman, muatan_pengumuman, gambar_pengumuman, date_created, user_created) VALUES (NULL, '"+judul_pengumuman+"', '"+muatan_pengumuman+"', '"+gambar_pengumuman+"', CURRENT_TIMESTAMP, '"+username+"')";
		conn.query(sql,(err,result)=>{
			res.redirect('/admin/pengumuman')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/edit_pengumuman/:id_pengumuman', function(req, res, next){
	if(req.session.loggedin){
		let id_pengumuman = req.params.id_pengumuman;
		var sql = "SELECT * FROM pengumuman WHERE id_pengumuman = '"+id_pengumuman+"'";
		conn.query(sql,(err,result)=>{
			res.render('admin_pengumuman_update',{pengumuman:result});
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.post('/update_pengumuman', function(req, res, next){
	if(req.session.loggedin){
		let id_pengumuman		= req.param('id_pengumuman');
		let judul_pengumuman	= req.param('judul_pengumuman');
		let muatan_pengumuman	= req.param('muatan_pengumuman');
		let gambar_pengumuman	= req.param('gambar_pengumuman');
		var sql = "UPDATE pengumuman SET judul_pengumuman = '"+judul_pengumuman+"', muatan_pengumuman = '"+muatan_pengumuman+"', gambar_pengumuman = '"+gambar_pengumuman+"' WHERE id_pengumuman = '"+id_pengumuman+"'";
		conn.query(sql,(err,result)=>{
			res.redirect('/admin/pengumuman')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/delete_pengumuman/:id_pengumuman', function(req, res, next){
	if(req.session.loggedin){
		let id_pengumuman = req.params.id_pengumuman;
		var sql = "DELETE FROM pengumuman WHERE id_pengumuman = '"+id_pengumuman+"'";
		conn.query(sql, function(err,result){
			if(err) throw err;
			res.redirect('/admin/pengumuman')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/galeri',function(req, res, next){
	if(req.session.loggedin){
		var sql = "SELECT id_foto, judul_foto, file_foto, DATE_FORMAT(date_created, '%d %b %Y %T') AS date_created, user_created FROM galeri ORDER BY id_foto DESC";
		conn.query(sql,(err,result)=>{
			res.render('admin_galeri',{galeri:result});
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.post('/insert_galeri', function(req, res, next){
	if(req.session.loggedin){
		let judul_foto	= req.param('judul_foto');
		let file_foto	= req.param('file_foto');
		let username 	= req.session.user;
		var sql = "INSERT INTO galeri (id_foto, judul_foto, file_foto, date_created, user_created) VALUES (NULL, '"+judul_foto+"', '"+file_foto+"', CURRENT_TIMESTAMP, '"+username+"')";
		conn.query(sql,(err,result)=>{
			res.redirect('/admin/galeri')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.post('/update_galeri', function(req, res, next){
	if(req.session.loggedin){
		let id_foto		= req.param('id_foto');
		let judul_foto	= req.param('judul_foto');
		let file_foto	= req.param('file_foto');
		var sql = "UPDATE galeri SET judul_foto = '"+judul_foto+"', file_foto = '"+file_foto+"' WHERE id_foto = '"+id_foto+"'";
		conn.query(sql,(err,result)=>{
			res.redirect('/admin/galeri')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/delete_galeri/:id_foto', function(req, res, next){
	if(req.session.loggedin){
		let id_foto = req.params.id_foto;
		var sql = "DELETE FROM galeri WHERE id_foto = '"+id_foto+"'";
		conn.query(sql, function(err,result){
			if(err) throw err;
			res.redirect('/admin/galeri')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/organisasi', function(req, res, next){
	if(req.session.loggedin){
		var sql = "SELECT * FROM organisasi WHERE id_organisasi = 1";
		conn.query(sql,(err,result)=>{
			res.render('admin_organisasi',{organisasi:result});
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/edit_organisasi', function(req, res, next){
	if(req.session.loggedin){
		var sql = "SELECT * FROM organisasi WHERE id_organisasi = 1";
		conn.query(sql,(err,result)=>{
			res.render('admin_organisasi_update', {organisasi:result});
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.post('/update_organisasi', function(req, res, next){
	if(req.session.loggedin){
		let id_organisasi		= req.param('id_organisasi');
		let nama_organisasi		= req.param('nama_organisasi');
		let foto_organisasi		= req.param('foto_organisasi');
		let tentang_organisasi	= req.param('tentang_organisasi');
		let motto_organisasi	= req.param('motto_organisasi');
		let sejarah_organisasi	= req.param('sejarah_organisasi');
		var sql = "UPDATE organisasi SET nama_organisasi = '"+nama_organisasi+"', foto_organisasi = '"+foto_organisasi+"', tentang_organisasi = '"+tentang_organisasi+"', motto_organisasi = '"+motto_organisasi+"', sejarah_organisasi = '"+sejarah_organisasi+"' WHERE id_organisasi = '"+id_organisasi+"'";
		conn.query(sql,(err,result)=>{
			res.redirect('/admin/organisasi')
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.get('/struktural',function(req, res, next){
	if(req.session.loggedin){
		var sql = "SELECT * FROM struktural ORDER BY id_jabatan ASC";
		conn.query(sql,(err,result)=>{
			res.render('admin_struktural',{struktural:result});
		});
	} else{
		res.redirect('/admin/login');
	}
});

router.post('/update_struktural', function(req, res, next){
	if(req.session.loggedin){
		let id_jabatan		= req.param('id_jabatan');
		let nama_jabatan	= req.param('nama_jabatan');
		let periode_jabatan	= req.param('periode_jabatan');
		let nama_penjabat	= req.param('nama_penjabat');
		let foto_penjabat	= req.param('foto_penjabat');
		var sql = "UPDATE struktural SET nama_jabatan = '"+nama_jabatan+"', periode_jabatan = '"+periode_jabatan+"', nama_penjabat = '"+nama_penjabat+"', foto_penjabat = '"+foto_penjabat+"' WHERE id_jabatan = '"+id_jabatan+"'";
		conn.query(sql,(err,result)=>{
			res.redirect('/admin/struktural')
		});
	} else{
		res.redirect('/admin/login');
	}
});

module.exports = router;