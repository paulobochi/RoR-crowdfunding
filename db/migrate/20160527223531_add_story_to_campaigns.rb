class AddStoryToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :story, :text
  end
end
