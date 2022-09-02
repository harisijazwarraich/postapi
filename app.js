const express = require('express')
const posts = require('./routes/posts')
const connectDB = require('./db/connect')
require('dotenv').config();

const app = express()

app.use(express.json())
app.use('/', (req, res) => {
    res.send('hi')
})
app.use('/api/v1/posts', posts)



const start = async () => {

    try {
        await connectDB(process.env.MONGO_URI)
        app.listen(5000, () => {
            console.log('listening on port 5000');
        })
    } catch (error) {
        console.log(error);
    }


}


start()



