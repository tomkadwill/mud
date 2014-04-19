class ControlPanelController < ApplicationController

  def index
    @user = current_user
    @story = current_user.story
  end

end
