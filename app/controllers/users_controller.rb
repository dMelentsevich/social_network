class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[update edit]
  before_action :pundit_authorize

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def pundit_authorize
    authorize @user || User
  end

  def user_params
    params.require(:user).permit(:name, :surname, :sex, :date_of_birth, :city, :phone_number)
  end
end
