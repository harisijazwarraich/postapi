import { Router } from 'express';
import { getAllPosts, createPost, getPostDetails, updatePost, deletePost, likePost } from '../controllers/post';
const router = Router()

//  routes for all endpoints

router.route('/').get(getAllPosts).post(createPost)
router.route('/:id').get(getPostDetails).patch(updatePost).delete(deletePost)
router.route('/:id').patch(likePost)


export default router;