class PostsController < ApplicationController

  def top
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_new = Post.new
    @user = @post.user
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'Book was successfully created.'
       redirect_to posts_path
    else
      @posts = Post.all
      render :index
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       flash[:notice] = "Book was successfully updated."
       redirect_to posts_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Book was successfully deleted."
      redirect_to posts_path
    else
      render :index
    end
  end

  private

  def post_params
      params.require(:post).permit(:title, :body)
  end
end
