class CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    @comment = @post.comments.build(comment_options)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to user_path(@post.user), notice: 'You have added comment' }
        format.js { @new_comment = Comment.new }
      end
    else
      respond_to do |format|
        format.html { render 'users/show' }
        format.js { @new_comment = @comment }
      end
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to user_path(@post.user), notice: 'The comment was deleted' }
        format.js
      end
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
