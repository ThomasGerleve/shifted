class UserShiftsController < ApplicationController

  def show
    @user_shift = UserShift.find(params[:id])
    @message = Message.new
  end

  def index
    # this is if we want to display a calendar
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
      || (user_shift.shift.date.year == @current.next_month.year \
      && user_shift.shift.date.month == @current.next_month.month) \
      || (user_shift.shift.date.year == @current.last_month.year \
      && user_shift.shift.date.month == @current.last_month.month)
    end

    @my_user_shifts = my_user_shifts.select do |user_shift|
      (user_shift.shift.date.year == @year && user_shift.shift.date.month == @month) \
      || (user_shift.shift.date.year == @current.next_month.year \
      && user_shift.shift.date.month == @current.next_month.month) \
      || (user_shift.shift.date.year == @current.last_month.year \
      && user_shift.shift.date.month == @current.last_month.month)
    end

    @user = current_user
    respond_to do |format|
      format.html
      format.json
    end
  end

  def offer
    @user_shift = UserShift.find(params[:id])
    return unless @user_shift.user == current_user

    bps = strong_params[:bonus_points].to_i
    @user_shift.user.bonus_points -= bps
    if @user_shift.update(strong_params)
      @user_shift.user.update({ bonus_points: @user_shift.user.bonus_points })
      redirect_to user_shift_path(@user_shift)
    else
      @user_shift.open = false
      @user_shift.bonus_points = 0
      @message = Message.new
      render :show
    end
  end

  def retract_offer
    user_shift = UserShift.find(params[:id])
    return unless user_shift.user == current_user

    user_shift.user.bonus_points += user_shift.bonus_points
    user_shift.user.update!({ bonus_points: user_shift.user.bonus_points })
    user_shift.update!({ open: false, bonus_points: 0 })
    redirect_to user_shift_path(user_shift)
  end

  def accept
    user_shift = UserShift.find(params[:id])
    return unless user_shift.open

    current_user.bonus_points += user_shift.bonus_points
    user_shift.update!({ open: false, bonus_points: 0, user: current_user })
    current_user.update!({ bonus_points: user_shift.user.bonus_points })
    redirect_to user_shift_path(user_shift)
  end

  private

  def strong_params
    params.require(:user_shift).permit(:bonus_points, :open)
  end

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
