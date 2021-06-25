class Posts::SearchesController < ApplicationController
  def search_params
    if params[:q].present?
      @search = Post.ransack(params[:id])
      @search_result = @search.result
      @search_word = @search.name_cont
    else
      params[:q] = { sorts: 'id desc' }
      @search = Post.ransack()
      @search_result = Post_all
    end
  end
end
