class AddStageRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :stage, index: true
  end
end
