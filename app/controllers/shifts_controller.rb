class ShiftsController < ApplicationController
  def index
    if params[:query].present?
      @shifts = params[:query] == "open" ? Shift.search_shifts_of_user_by_id(current_user.id) : Shift.search_by_open
    else
      @shifts = Shift.all
    end
    if params[:year].present? && params[:year].year?
      @year = params[:year].to_i
    else
      @year = Time.new.year
    end
    if params[:month].present? && (1..12).include?(params[:month].to_i)
      @month = params[:month].to_i
    else
      @month = Time.new.month
    end
  end

  private

  def year?(year)
    # year.to_i.to_s == year && year.length == 4
    Time.parse(year, now).year == year
  end
end
