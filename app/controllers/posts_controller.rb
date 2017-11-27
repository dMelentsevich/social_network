class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Micropost created!"
      redirect_to user_path(@user)
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
