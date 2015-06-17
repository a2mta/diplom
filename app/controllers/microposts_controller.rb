class MicropostsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: :destroy

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
    @micropost.destroy
    redirect_to current_user
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :microphoto)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end

