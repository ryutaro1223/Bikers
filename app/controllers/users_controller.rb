class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(3)
  end

  def new
    @user = User.new
  end

  def edit
   @user = User.find(params[:id])
     if @user.id != current_user.id
       redirect_to user_path(current_user.id)
     end
  end

  def update
   @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
     else
      render :edit
     end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
end
