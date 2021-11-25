class PagesController < ApplicationController
  def home
  end

  def dashboard
    @next_shift = current_user.shifts.where('date > ?', DateTime.now).order(:date).first
  end
end
