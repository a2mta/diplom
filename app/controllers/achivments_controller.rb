class AchivmentsController < ApplicationController
  before_action :signed_in_user

  def create
    @achivment = current_user.achivments.build(achivment_params)
    if @achivment.save
      flash[:success] = "Achve created!"
      redirect_to current_user
    end
  end

  def destroy
  end

  private

  def achivment_params
    params.require(:achivment).permit(:content, :achive_type, :start, :finish, :count, :time)
  end
end
