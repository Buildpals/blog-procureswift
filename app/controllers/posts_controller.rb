class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def new
    if user_signed_in?
      @post = Post.new
    else
      redirect_to root_path
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to @post
  end

  def show
    #puts @post.inspect
    if @post == nil
      redirect_to root_path
    else
      if @post.draft == true && current_user == nil
        redirect_to root_path
      end
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :main_image, :draft, :catergory, :sub_title)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end

end
