class PostsController < ApplicationController
  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    # ページネーションを追加
    @posts = Post.all.page(params[:page]).per(5)
    # @post = Post.search(params[:search])
   
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = current_user.comments.new
    @favorites = @post.favorites

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private

  def post_params
    params.require(:post).permit(:post_name, :image, :caption, :keyword, { genre_ids: []})
  end
end
