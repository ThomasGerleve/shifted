require 'time'

class ShiftsController < ApplicationController
  def index
    if params[:query].present?
      # this is if we want to display a calendar
      @query = params[:query]

      @shifts = @query == "open" ? Shift.search_by_open : UserShift.search_shifts_of_user_by_id(1)
      # if the searchword is exactly "open": index open shifts, else: index current user's shifts

      @year = params[:year].present? && year?(params[:year]) ? params[:year].to_i : Time.new.year
      # if there are year params: show calendar of that year, else: show calendar of current year

      @month = params[:month].present? && (1..12).include?(params[:month].to_i) ? params[:month].to_i : Time.new.month
      # if there are month params: show that month, else: show current month
      @mth = %w[nil Jan Feb Mar Apr Jun Jul Aug Sep Oct Nov Dec]
    else
      # this is if we want to view all shifts - without calendar
      @shifts = Shift.all
    end
    @shifts = @shifts.select { |shift|}
  end

  private

  def year?(year)
    year.to_i.to_s == year && year.length == 4
    # now = Time.new
    # time = Time.parse(year, now)
    # time.year == year
  end
end
