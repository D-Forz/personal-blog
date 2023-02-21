class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    post
  end

  def new
    @post = Post.new
  end

  def edit
    post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post.destroy
    redirect_to posts_path, status: :see_other
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :status)
  end
end
