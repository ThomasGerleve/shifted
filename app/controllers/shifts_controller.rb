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

      @days = days(@month, @year)
      # range of amount of days in that month
      @current = Time.parse("#{@year}-#{@month}-01")

      @shifts = shifts.select do |user_shift|
        (user_shift.shift.date.year == @year && user_shift.shift.date.month == @month) \
        || (user_shift.shift.date.year == @current.next_month.year && user_shift.shift.date.month == @current.next_month.month) \
        || (user_shift.shift.date.year == @current.next_month.year && user_shift.shift.date.month == @current.next_month.month)
      end
    else
      # this is if we want to view all shifts - without calendar
      shifts = Shift.all
      @shifts = shifts.select { |shift| shift.date > DateTime.new }
    end
    @user = current_user
    @shifts = @shifts.uniq
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def year?(year)
    year.to_i.to_s == year && year.length == 4
  end

  def days(month, year)
    days = []
    first = Time.parse("#{year}-#{month}-01")
    # determine first day of the month we want to show
    how_many_from_last_month = (22..Time.days_in_month(first.last_month.month, first.last_month.year)).last(first.wday)
    # determine the last days of the previous month that belong to this month's first week
    days << how_many_from_last_month

    this_month = (1..Time.days_in_month(month, year))
    days << this_month
    # inject the amount of days this month

    days << (1..(7 - ((this_month.last + first.wday) % 7)))
    # populate rest of last week with start of next month
  end
end
