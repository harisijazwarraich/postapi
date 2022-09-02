const Post = require('../models/post');



const getAllPosts = async (req, res) => {
    try {
        const posts = await Post.find({});
        return res.status(200).json({ posts })
    } catch (error) {
        res.status(501).json({ msg: error })
    }

}
const getPostDetails = async (req, res) => {

    try {
        
        const post = await Post.findById(req.params.id);

        if (!post) {
            return res.status(404).json({ msg: `Unable to find the post with the given id ${req.params.id}` })
        }

        res.status(200).json({ post });

    } catch (error) {
        res.status(501).json({ msg: error })
    }




}
const createPost = async (req, res) => {

    try {
        const post = await Post.create(req.body)
        res.status(201).json({ post });
    } catch (error) {
        res.status(500).json({ msg: error })
    }

}


const likePost = async (req, res) => {
    try {
        const post = await Post.findByIdAndUpdate(req.params.id, req.body, { new: true })


        if (!post) {
            return res.status(404).json({ msg: 'not found!' })
        }

        res.status(200).json({ post })


    } catch (error) {
        res.status(500).json({ msg: error })
    }
}



const updatePost = async (req, res) => {

    try {
        const { id: postID } = req.params;

        const post = await Post.findOneAndUpdate({ _id: postID }, req.body, { new: true, runValidators: true });


        if (!post) {
            return res.status(404).json({ msg: `unable to find the post with the given ID ${postID}` });
        }

        res.status(200).json({ post })

    } catch (error) {
        res.status(500).json({ msg: error });

    }

}

const deletePost = async (req, res) => {
    try {
        const { id: postID } = req.params;
        const post = await Post.findOneAndDelete({ _id: postID });

        if (!post) {
            return res.status(404).json({ msg: `unable to find the post with the given ID ${postID}` });
        }

        res.status(200).json({ post })


    } catch (error) {
        res.status(500).json({ msg: error });
    }
}


module.exports = { getAllPosts, getPostDetails, updatePost, createPost, deletePost, likePost }