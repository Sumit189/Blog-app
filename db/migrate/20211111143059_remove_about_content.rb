class RemoveAboutContent < ActiveRecord::Migration[6.1]
  def change
    drop_table :about_contents
  end
end
