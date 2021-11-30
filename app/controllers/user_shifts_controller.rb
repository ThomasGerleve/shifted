class UserShiftsController < ApplicationController

  def show
    @user_shift = UserShift.find(params[:id])
  end
end
