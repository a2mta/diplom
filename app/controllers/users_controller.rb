class UsersController < ApplicationController
  before_action :admin_user, only: :destroy

  def new
    @title = "Sign up"
    @user = User.new
  end

  def index
    if signed_in?
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)

      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to sample application!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удален."
    redirect_to users_url
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
    @micropost = current_user.microposts.build if signed_in?
    @achivments = @user.achivments
    @achivment = current_user.achivments.build if signed_in?
  end

  def following
    @title = "Заявки в друзья"
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Друзья"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private

  def admin_user
    @user = User.find(params[:id])
    redirect_to(root_path) if !current_user.admin? || current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :email, :info, :password, :password_confirmation)
  end
end
