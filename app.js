var createError = require('http-errors');
var express = require('express');
var session = require('express-session');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter 	= require('./routes/index');
var usersRouter 	= require('./routes/users');
var websiteRouter	= require('./routes/website');
var adminRouter		= require('./routes/admin');

var app = express();

app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

app.use(function(req, res, next){
	res.locals.user     = req.session.user;
  res.locals.username = req.session.username;
	next();
});

// view engine setup
app.use('/public_website',express.static(path.join(__dirname,'static/website')));
app.use('/public_admin',express.static(path.join(__dirname,'static/admin')));
//app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public_website')));
app.use(express.static(path.join(__dirname, 'public_admin')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/website', websiteRouter);
app.use('/admin', adminRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
