require 'spec_helper'

describe ControlPanelController do
  
  before (:each) do
    @stage = FactoryGirl.create(:stage)
    @user = FactoryGirl.create(:user, stage: @stage)
    sign_in @user
  end

  it "loads the control panel" do
  	controller.stub(:user) { user }
    get :index
    response.should be_success
    assigns(:user).should == @user
    assigns(:story).should == @stage.story
  end

end
