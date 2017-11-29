class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_path(@post.user), notice: 'The post was created'
    else
      render 'users/show'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to user_path(@post.user), notice: 'The post was deleted'
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
