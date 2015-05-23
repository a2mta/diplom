class MicropostsController < ApplicationController
  before_action :signed_in_user

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Пост создан!"
      redirect_to @current_user
    else
      flash[:error] = "Пост не может быть пустым"
      redirect_to @current_user
    end
  end

  def destroy
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end

