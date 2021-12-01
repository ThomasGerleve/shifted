class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @users = User.new
  end
end
