class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    #binding.irb
      render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
      render :index
  end

  private

    def comment_params
      params.require(:comment).permit(:comment_content, :post_id, :user_id)
    end
end