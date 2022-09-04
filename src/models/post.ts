import mongoose from 'mongoose';
const { Schema } = mongoose;

const postSchema = new Schema({
    title: String,
    likes: { type: Number, default: 0 }
})


export default mongoose.model('Post', postSchema)