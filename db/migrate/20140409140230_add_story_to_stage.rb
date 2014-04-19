class AddStoryToStage < ActiveRecord::Migration
  def change
    add_column :stages, :story, :text
  end
end
