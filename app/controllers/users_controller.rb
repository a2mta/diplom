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

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to sample application!"
      redirect_to @user
    else
      @title = "Sign Up"
      render 'new'
    end
  end

  def show
    @user  = User.find(params[:id])
  end

  private
  ## Strong Parameters
  def user_params
    params.require(:user).permit(:name, :email, :info, :password, :password_confirmation)
  end
end
