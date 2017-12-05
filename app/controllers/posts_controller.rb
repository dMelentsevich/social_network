class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: :destroy
  before_action :pundit_authorize

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
    if @post.destroy
      redirect_to user_path(@post.user), notice: 'The post was deleted'
    else
      redirect_to user_path(@post.user), alert: 'You can not delete this post' 
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_options
    post_params.merge({ user: current_user })
  end

  def post_params
    params.require(:post).permit(:body)
  end

  def pundit_authorize
    authorize @post || Post
  end
end
