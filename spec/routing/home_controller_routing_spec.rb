require "spec_helper"

describe "routes for home page" do
  before (:each) do
    allow_message_expectations_on_nil
    allow_any_instance_of(Object).to receive(:authenticate?).and_return(false)
  end

  it "routes / to the control panel controller" do
    { :get => "/" }.
      should route_to(:controller => "home", :action => "index")
  end
end
