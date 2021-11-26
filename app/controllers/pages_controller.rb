class PagesController < ApplicationController
  def home
  end

  def dashboard
    @next_shift = current_user.shifts.where('date > ?', DateTime.now).order(:date).first
    @next_shift_slot = @next_shift.slot.name




  end
end
