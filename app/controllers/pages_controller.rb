class PagesController < ApplicationController
  def home
    return unless user_signed_in?

    @next_user_shift = current_user.user_shifts.select { |u_shift| u_shift.shift.date > DateTime.now }.min_by { |u_shift| u_shift.shift.date }
    @emergency_shifts = UserShift.all.select { |u_shift| u_shift.open && u_shift.user_id.nil? && u_shift.shift.date > DateTime.now }.sort_by { |u_shift| u_shift.shift.date }
    @open_shifts = UserShift.all.select { |u_shift| u_shift.open && !u_shift.user_id.nil? && u_shift.shift.date > DateTime.now }.sort_by { |u_shift| u_shift.shift.date }
  end
end
