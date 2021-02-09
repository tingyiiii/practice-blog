class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_post, only: [:show]
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path, notice: "文章新增成功"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: "文章更新成功"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "文章已刪除"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end