require "spec_helper"

describe "routes for control panel" do
  before (:each) do
    allow_message_expectations_on_nil
    allow_any_instance_of(Object).to receive(:authenticate?).and_return(true)
  end

  it "routes / to the control panel controller" do
    { :get => "/" }.
      should route_to(:controller => "control_panel", :action => "index")
  end
end
