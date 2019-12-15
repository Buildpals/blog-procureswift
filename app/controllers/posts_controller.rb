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
    flash[:notice] = 'Post has been successfully created. If you want users to see, you\'ll have to untick the draft option.'
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
    flash[:notice] = 'Post has been successfully updated.'
    redirect_to @post
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post has been successfully deleted.'
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :main_image, :draft, :catergory, :sub_title)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end

end
