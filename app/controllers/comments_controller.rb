class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[create destroy]
  before_action :set_comment, only: %i[destroy]
  before_action :pundit_authorize

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

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_options
    comment_params.merge({ user: current_user })
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def pundit_authorize
    authorize @comment || Comment
  end
end
