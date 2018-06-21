class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def show
      @user = User.find(params[:id])
      @posts = @user.posts
      @post_new = Post.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path
    else
    end
  end

  def destroy
    
  end

  def update
  	@user = current_user
    if @user.update(user_params)
  	   redirect_to user_path(@user)
    else
       render 'edit'
    end
  end

  def index
    @users = User.all
    @post_new = Post.new
  end

  private

  def user_params
  	params.require(:user).permit(:name, :image, :introduction)
  end

end