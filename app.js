const express = require('express')
const posts = require('./routes/posts')
const connectDB = require('./db/connect')
require('dotenv').config();

const app = express()

app.use(express.json())

app.use('/api/v1/posts', posts)



const start = async () => {

    try {
        await connectDB(process.env.MONGO_URI)
        app.listen(process.env.PORT || 5000, () => {
            console.log('listening on port 5000');
        })
    } catch (error) {
        console.log(error);
    }


}


start()



