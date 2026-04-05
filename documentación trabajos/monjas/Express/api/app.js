var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var parseurl = require('parseurl')
var session = require('express-session')
var cors = require('cors');
var mariadb = require('mariadb');

var userRouter = require('./routes/v1/user');

app = express();

pool = mariadb.createPool({
   host: '127.0.0.1', 
   user:'localhost', 
   password: 'localhost',
   connectionLimit: 5
});

app.set('secret', 'SESSION_SECRET');
app.set('sess-expire', 900);

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.disable('x-powered-by');

app.set('trust proxy', 1);
app.use(session({
   secret: app.get('secret'),
   name : 'sessionId',
   resave: false,
   saveUninitialized: true,
   cookie: {
      secure: false,
      // sameSite: 'none'
   }
}));

app.use((req, res, next) => {   
   res.header('credentials', 'include');
   res.header('Access-Control-Allow-Origin', 'http://localhost:4200');
   res.header('Access-Control-Allow-Credentials', true);
   res.header('Access-Control-Allow-Headers', 'Authorization, Content-Type, X-Requested-With, X-HTTP-Method-Override, Accept');
   // res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
   next();
});

// Session middleware
app.use(function (req, res, next) {

   if (!req.session.views) {
      req.session.views = {}
   }

   // get the url pathname
   var pathname = parseurl(req).pathname

   // count the views
   req.session.views[pathname] = (req.session.views[pathname] || 0) + 1
   
   next()
});

// Routes
app.use('/user', userRouter);
app.use('/v1/user', userRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
   next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
   // set locals, only providing error in development
   res.locals.message = err.message;
   res.locals.error = req.app.get('env') === 'development' ? err : {};

   res.status(404).json({ code: 400, error: err });
});

module.exports = app;
