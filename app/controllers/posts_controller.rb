class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to user_path(@post.user)
    else
      render 'users/show'
    end
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:body)
    end
end
