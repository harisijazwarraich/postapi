const express = require('express');
const { getAllPosts, createPost, getPostDetails, updatePost, deletePost, likePost } = require('../controllers/post');
const router = express.Router()

//  routes for all endpoints

router.route('/').get(getAllPosts).post(createPost)
router.route('/:id').get(getPostDetails).patch(updatePost).delete(deletePost)
router.route('/:id').patch(likePost)


module.exports = router