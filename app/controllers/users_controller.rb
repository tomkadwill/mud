class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :call_logger2

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def call_logger2
    logger.debug 'UsersController log'
  end
end
