module Api
    module V1
        class PostsController < ApplicationController
            # Authenticate all of our posts routes
            before_action :authorize_request
            
            # This method returns all the Posts in the database
            def index 
                post = Post.order('id ASC');
                render json: {
                    status: 'Success',
                    message: 'All Posts',
                    data: post,
                    },
                    status: :ok
            end

            # Create a new post
            def create
                post = Post.new(post_params)
                    if post.save
                        render json: {
                            status: 'Success',
                            message: 'Post saved',
                            data: post,
                            },
                            status: :created
                    else 
                        render json: {
                            status: 'Error',
                            message: 'Post not saved',
                            data: post.errors,
                            },
                            status: :unprocessable_entity
                    end
            end

            # Returns a single post associated with that id
            def show
                post = Post.find(params[:id])
                render json: {
                    status: 'Success',
                    message: 'Loaded post',
                    data: post,
                    },
                    status: :ok
            end

            # Update a post associted with that id in the database
            def update
                post = Post.find(params[:id])
                if post.update_attributes(post_params)
                    render json: {
                        status: 'Success',
                        message: 'Post updated',
                        data: post
                        },
                        status: :ok
                else 
                    render json: {
                        status: 'Success',
                        message: 'Post not updated',
                        data: post,
                        },
                        status: :unprocessable_entity
                end
            end

            # Delete a post from the database
            def destroy
                post = Post.find(params[:id])
                post.destroy
                render json: {
                    status: 'Success',
                    message: 'Post deleted',
                    data: post,
                    },
                    status: :ok
            end

            private 
            def post_params
                params.permit(:title, :body)
            end
        end
    end
end