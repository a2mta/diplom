class UsersController < ApplicationController
  before_action :admin_user, only: :destroy
  before_action :correct_user, only: :destroy

  def new
    @title = "Регистрация"
    @user = User.new
  end

  def index
    if signed_in?
      @title = "Все пользователи"
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Изменение данных"
  end

  def feed
    if signed_in?
      @feed_items = current_user.feed
      @achive_feed_items = current_user.achive_feed
      @title = "Лента новостей"
    else
      redirect_to root_path
    end
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
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удален."
    redirect_to current_user
  end


  def show
    if signed_in?
      @title = "Профиль"
      @user = User.find(params[:id])
      @microposts = @user.microposts
      @micropost = current_user.microposts.build if signed_in?
      @achivments = @user.achivments
      @achivment = current_user.achivments.build if signed_in?
    else
      redirect_to root_path
    end

  end

  def following
    @title = "Подписки"
    @little_title = "подписки"
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Подписчики"
    @little_title = "подписчики"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private

  def admin_user
    @user = User.find(params[:id])
    redirect_to(root_path) if !current_user.admin? || current_user?(@user)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :email, :info, :password, :password_confirmation)
  end
end
