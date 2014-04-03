class ControlPanelController < ApplicationController

  def index
    @user = current_user
    @story = 'Welcome to Level 1.'
  end

end
