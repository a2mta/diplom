class AchivmentsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: :destroy

  def create
    @achivment = current_user.achivments.build(achivment_params)
    if @achivment.save
      flash[:success] = "Achve created!"
      redirect_to current_user
    else
      flash[:achive_error] = "Заполнены не все обязательные поля"
      redirect_to @current_user
    end
  end

  def destroy
    @achivment.destroy
    redirect_to current_user
  end

  private

  def achivment_params
    params.require(:achivment).permit(:achive_content, :achive_type, :start, :finish, :count, :time, :achive_photo)
  end
  def correct_user
    @achivment = current_user.achivments.find_by(id: params[:id])
    redirect_to root_url if @achivment.nil?
  end
end
