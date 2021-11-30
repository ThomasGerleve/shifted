class PagesController < ApplicationController
  def home
    return unless user_signed_in?

    @next_shift = current_user.shifts.where('date > ?', DateTime.now).order(:date).first
    @next_shift_slot = @next_shift.slot.name
    @open_shifts = UserShift.all.select(&:open).sort_by { |u_shift| u_shift.shift.date }
  end
end
