class ShiftsController < ApplicationController
  def index
    if params.present?
      # this is if we want to display a calendar
      @version = params[:version]

      open_user_shifts = UserShift.all.select(&:open)
      my_user_shifts = current_user.user_shifts
      # if the searchword is exactly "open": index open shifts, else: index current user's shifts

      @year = params[:year].present? && year?(params[:year]) ? params[:year].to_i : Time.new.year
      # if there are year params: show calendar of that year, else: show calendar of current year

      @month = params[:month].present? && (1..12).include?(params[:month].to_i) ? params[:month].to_i : Time.new.month
      # if there are month params: show that month, else: show current month
      mth = %w[nil Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]
      @mth = mth[@month]

      @days = days(@month, @year)
      # range of amount of days in that month
      @current = Time.parse("#{@year}-#{@month}-01")

      @open_user_shifts = open_user_shifts.select do |user_shift|
        (user_shift.shift.date.year == @year && user_shift.shift.date.month == @month) \
        || (user_shift.shift.date.year == @current.next_month.year && user_shift.shift.date.month == @current.next_month.month) \
        || (user_shift.shift.date.year == @current.last_month.year && user_shift.shift.date.month == @current.last_month.month)
      end

      @my_user_shifts = my_user_shifts.select do |user_shift|
        (user_shift.shift.date.year == @year && user_shift.shift.date.month == @month) \
        || (user_shift.shift.date.year == @current.next_month.year && user_shift.shift.date.month == @current.next_month.month) \
        || (user_shift.shift.date.year == @current.last_month.year && user_shift.shift.date.month == @current.last_month.month)
      end
    else
      # this is if we want to view all shifts - without calendar
      shifts = Shift.all
      @shifts = shifts.select { |shift| shift.date > DateTime.new }
    end
    @user = current_user
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @shift = Shift.find(params[:id])
  end

  private

  def year?(year)
    year.to_i.to_s == year && year.length == 4
  end

  def days(month, year)
    days = {}
    first = Time.parse("#{year}-#{month}-01")
    # determine first day of the month we want to show
    last_weekday_last_month = first.wday.zero? ? 6 : first.wday - 1
    days_last_month = (23..Time.days_in_month(first.last_month.month, first.last_month.year)).last(last_weekday_last_month)
    # determine the last days of the previous month that belong to this month's first week
    days[:last_month] = days_last_month.length.positive? ? days_last_month : []

    days_this_month = (1..Time.days_in_month(month, year))
    days[:this_month] = days_this_month
    # inject the amount of days this month
    missing = (days_this_month.last + last_weekday_last_month) % 7
    days[:next_month] = missing.zero? ? [] : (1..(7 - missing))
    # populate rest of last week with start of next month
    days
  end
end
