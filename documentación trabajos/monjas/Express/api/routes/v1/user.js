var express = require('express');
var router = express.Router();
const crypto = require("crypto");
const jwt = require('jsonwebtoken');

// Import model
const UserModel = require('../../models/userModel');
var user = new UserModel();

const checkAuthorization = express.Router(); 
checkAuthorization.use((req, res, next) => {
   const authorization = req.headers.authorization;
   const token = authorization.split(" ")[1];
 
   if (token) {
      jwt.verify(token, app.get('secret'), (err, decoded) => {      
         if (err) {
            return res.status(401).json({ code: 401, data: 'NOT AUHTORIZED' });
         } else {
            next();
         }
      });
   } else {
      res.json({ code: 1, data: 'NOT AUHTORIZED' });
   }
});

function generateAccessToken(expires) {
   const payload = {};
   let token;

   if ( expires ) {
      token = jwt.sign(payload, app.get('secret'), {  });
   } else {
      token = jwt.sign(payload, app.get('secret'), { expiresIn: app.get('sess-expire') });
   }

   return token;
}
function generateRefreshToken() {
   return crypto.randomBytes(25).toString('hex');
}

router.post('/login', function(req, res, next) {
   user.verifyCredentials(req.body.form.user, req.body.form.pass)
   .then((response) => {
      let data = null;

      if ( response.code === 0 ) {
         req.session.userId = response.id;
         req.session.keepLogged = req.body.form.keep;

         const access_token = generateAccessToken(req.session.keepLogged); 
         req.session.token = access_token;

         const refresh_token = generateRefreshToken();
         user.setRefreshToken(response.id, refresh_token, req.session.keepLogged ? 1 : 0)

         res.json({ code: response.code, access_token: access_token, refresh_token: refresh_token });
      } else {
         res.json({ code: response.code });
      }

   });
});

router.post('/loginToken', function(req, res, next) {
   user.verifyToken(req.body.token)
   .then((response) => {
      let data = null;

      if ( response.code === 0 ) {
         req.session.userId = response.id;
         req.session.keepLogged = Number(response.keepLogged) ? true : false;

         const access_token = generateAccessToken(req.session.keepLogged); 
         req.session.token = access_token;

         const refresh_token = generateRefreshToken();
         user.setRefreshToken(response.id, refresh_token, req.session.keepLogged ? 1 : 0)

         res.json({ code: response.code, access_token: access_token, refresh_token: refresh_token });
      } else {
         res.json({ code: response.code });
      }

   });
});

router.get('/logout', function(req, res, next) {
   req.session.destroy();
   res.status(200).json();
});

router.post('/refreshToken', function(req, res, next) {
   user.verifyRefresh(req.body.refreshToken)
   .then((response) => {
      if ( response ) {
         const access_token = generateAccessToken(req.session.keepLogged); 
         req.session.token = access_token;

         const refresh_token = generateRefreshToken();
         user.setRefreshToken(req.session.userId, refresh_token)

         res.json({ code: 0, access_token: access_token, refresh_token: refresh_token });
      } else {
         res.status(401).json({ code: 401 });
      }
   });
});

router.get('/getData', checkAuthorization, function(req, res, next) {
   console.log(req.session);

   user.readData(req.session.userId)
   .then((response) => {
      if ( response !== null ) {
         res.json({ code: 0, data: response });
      } else {
         res.json({ code: 1, data: 'Error reading data' });
      }
   });
   
});

leerAPIClima();
setInterval(() => leerAPIClina)

function leerAPIClina() {

}

module.exports = router;
