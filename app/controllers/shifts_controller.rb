class ShiftsController < ApplicationController
  def index
    shifts = Shift.all
    @shifts = shifts.select { |shift| shift.date > DateTime.new }
  end
end
