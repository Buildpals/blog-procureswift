class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :main_image, :draft, :catergory)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end

end
