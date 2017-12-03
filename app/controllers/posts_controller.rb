class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.new(post_options)
    if @post.valid?
      @post.save
      redirect_to user_path(@post.user), notice: 'The post was created'
    else
      @user = current_user
      render 'users/show'
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.user == current_user && @post.destroy
      redirect_to user_path(current_user), notice: 'The post was deleted'
    else
      redirect_to user_path(@post.user), alert: 'You can not delete this post' 
    end
  end

  private

  def post_options
    post_params.merge({ user: current_user })
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
