class UsersController < ApplicationController
  before_action :authenticate_user! , only: [:index]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
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

    def user_params
      params.require(:user).permit(:name, :surname, :sex, :date_of_birth, :city, :phone_number)
    end
end