class PagesController < ApplicationController
  def home
    return unless user_signed_in?

    @shift_last_seen = session[:shift_last_seen]
    session[:shift_last_seen] = DateTime.now

    @next_user_shift = current_user.user_shifts.select { |u_shift| u_shift.shift.date > DateTime.now }.sort_by { |u_shift| u_shift.shift.date }.first
    @emergency_shifts = UserShift.all.select { |u_shift| u_shift.open && u_shift.user_id == nil }.sort_by { |u_shift| u_shift.shift.date }
    @open_shifts = UserShift.all.select { |u_shift| u_shift.open && !u_shift.user_id.nil? }.sort_by { |u_shift| u_shift.shift.date }
  end
end
