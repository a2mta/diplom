class UsersController < ApplicationController
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

  def show
    @user  = User.find(params[:id])
    @microposts = @user.microposts
    @micropost = current_user.microposts.build if signed_in?
  end

  private
  ## Strong Parameters
  def user_params
    params.require(:user).permit(:name, :avatar, :email, :info, :password, :password_confirmation)
  end
end
