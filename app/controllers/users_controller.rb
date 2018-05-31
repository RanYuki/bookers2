class UsersController < ApplicationController
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user)
  end

  def index
    @users = Users.all
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile_image)
  end
end
