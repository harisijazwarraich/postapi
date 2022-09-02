const mongoose = require('mongoose');


const connectDB = (url) => {
   return mongoose.connect(url, {
      server: {
         socketOptions: { keepAlive: 300000, connectTimeoutMS: 30000 }
      },
      replset: {
         socketOptions: { keepAlive: 300000, connectTimeoutMS: 30000 }
      }
   }
   );
}



module.exports = connectDB