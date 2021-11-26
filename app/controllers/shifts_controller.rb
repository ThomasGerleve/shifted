require 'time'

class ShiftsController < ApplicationController
  def index
    if params.present?
      # this is if we want to display a calendar
      @version = params[:version]

      shifts = @version == "open" ? UserShift.all.select(&:open) : current_user.user_shifts
      # if the searchword is exactly "open": index open shifts, else: index current user's shifts

      @year = params[:year].present? && year?(params[:year]) ? params[:year].to_i : Time.new.year
      # if there are year params: show calendar of that year, else: show calendar of current year

      @month = params[:month].present? && (1..12).include?(params[:month].to_i) ? params[:month].to_i : Time.new.month
      # if there are month params: show that month, else: show current month
      mth = %w[nil Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]
      @mth = mth[@month]

      @days = days(@year, @month)
      # range of amount of days in that month

      @shifts = shifts.select { |user_shift| user_shift.shift.date.year == @year && user_shift.shift.date.month == @month }
    else
      # this is if we want to view all shifts - without calendar
      shifts = Shift.all
      @shifts = shifts.select { |shift| shift.date > DateTime.new }
    end
    @user = current_user
    @shifts = @shifts.uniq
  end

  private

  def year?(year)
    year.to_i.to_s == year && year.length == 4
  end

  def days(year, month)
    days = 30
    days = 31 if month > 7 && month.even?
    days = 31 if month <= 7 && month.odd?
    days = 28 if month == 2
    days = 29 if month == 2 && (year % 4).zero?
    (1..days)
  end
end
