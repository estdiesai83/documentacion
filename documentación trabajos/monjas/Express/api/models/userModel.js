const bcrypt = require('bcrypt');

class User {

   async verifyCredentials(user, pass) {
      const conn = await pool.getConnection();
      const rows = await conn.query("SELECT id, password FROM DATABASE.User WHERE name = '" + user + "'");
      conn.end();

      if ( rows.length ) {
         const match = await bcrypt.compare(pass, rows[0].password);

         if ( match ) {
            return { code: 0, id: rows[0].id };
         } else {
            return { code: 1 };
         }
      } else {
         return { code: 2 };
      }
   }

   async verifyToken(token) {
      const conn = await pool.getConnection();
      const rows = await conn.query("SELECT id, keep_logged FROM DATABASE.User WHERE refresh_token = '" + token + "' AND expired_at > now()");
      conn.end();

      if ( rows.length ) {
         return { code: 0, id: rows[0].id, keepLogged: rows[0].keep_logged };
      } else {
         return { code: 2 };
      }
   }

   async verifyRefresh(token) {
      const conn = await pool.getConnection();
      const rows = await conn.query("SELECT id FROM DATABASE.User WHERE refresh_token = '" + token + "' AND expired_at > now()");
      conn.end();

      if ( rows.length ) {
         return true;
      } else {
         return false;
      }
   }

   async setRefreshToken(id, refresh, keepLogged) {
      const conn = await pool.getConnection();
      await conn.query("UPDATE DATABASE.User SET refresh_token = '" + refresh + "', expired_at = ADDTIME(now(), '24:00:00'), keep_logged = " + keepLogged + " WHERE id = '" + id + "'");
      conn.end();
   }

   async readData(id) {
      const conn = await pool.getConnection();
      const rows = await conn.query("SELECT nick FROM DATABASE.User WHERE id = '" + id + "'");
      conn.end();

      if ( rows.length ) {
         return rows[0];
      } else {
         return null;
      }
      
   }
}

module.exports = User;