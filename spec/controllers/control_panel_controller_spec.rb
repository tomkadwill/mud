require 'spec_helper'

describe ControlPanelController do
  
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  it "loads the control panel" do
  	controller.stub(:user) { user }
    get :index
    response.should be_success
    assigns(:user).should == @user
    assigns(:story).should == 'Welcome to Level 1.'
  end

end
