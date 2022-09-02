const mongoose = require('mongoose');
const { Schema } = mongoose;

const postSchema = new Schema({
    title: String,
    likes: { type: Number, default: 0 }
})


module.exports = mongoose.model('Post', postSchema)