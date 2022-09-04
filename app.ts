import * as express from "express";
import posts from './src/routes/posts';
import connectDB from './src/db/connect';
import * as dotenv from "dotenv";
dotenv.config({ path: __dirname+'/.env' });
const app = express()

app.use(express.json())

app.use('/api/v1/posts', posts)


const start = async () => {

    try {
        await connectDB(process.env.MONGO_URI || '')
        app.listen(process.env.PORT || 5000, () => {
            console.log(`listening on ${process.env.PORT}`);
        })
    } catch (error) {
        console.log(error);
    }


}


start()


