class CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    @comment = @post.comments.build(comment_options)
    if @comment.save
      redirect_to user_path(@post.user), notice: 'You have added comment'
    else
      render 'users/show' 
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to user_path(@post.user), notice: 'The comment was deleted'
    end
  end
  
  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_options
    comment_params.merge({ user: current_user })
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
