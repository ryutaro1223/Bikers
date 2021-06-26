class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post was successfully created. "
      redirect_to posts_path
    else
      flash.now[:alert] = "Post was not successfully created."
      redirect_to new_post_path
    end
  end

  def index
  # ページネーションを追加
  @posts = Post.all.page(params[:page]).per(5)

  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc).page(params[:page]).per(3)
    @favorites = @post.favorites

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.search(params[:keyword])
    @posts = @posts.page(params[:page])
    render "index"
  end

  private

  def post_params
    params.require(:post).permit(:post_name, :image, :caption, :keyword, { genre_ids: []})
  end
end
