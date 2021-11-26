class PagesController < ApplicationController
  def home
  end

  def dashboard
    @next_shift = current_user.shifts.where('date > ?', DateTime.now).order(:date).first
    @next_shift_slot = @next_shift.slot.name
    @next_shift_start = @next_shift.slot.start_time
    @next_shift_end = @next_shift.slot.end_time


  end
end
