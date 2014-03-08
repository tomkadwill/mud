require "spec_helper"

describe "routes for control panel" do
  it "routes / to the control panel controller" do
    { :get => "/" }.
      should route_to(:controller => "control_panel", :action => "index")
  end
end
