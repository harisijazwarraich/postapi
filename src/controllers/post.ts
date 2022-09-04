import Post from '../models/post';



export const getAllPosts = async (req, res): Promise<any> => {
    try {
        const posts = await Post.find({});
        return res.status(200).json({ posts })
    } catch (error) {
        res.status(501).json({ msg: error })
    }

}
export const getPostDetails = async (req, res): Promise<any> => {

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
export const createPost = async (req, res): Promise<void> => {

    try {
        const post = await Post.create(req.body)
        res.status(201).json({ post });
    } catch (error) {
        res.status(500).json({ msg: error })
    }

}


export const likePost = async (req, res): Promise<any> => {
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



export const updatePost = async (req, res): Promise<any> => {

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

export const deletePost = async (req, res): Promise<any> => {
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


