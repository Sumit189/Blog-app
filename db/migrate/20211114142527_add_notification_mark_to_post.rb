class AddNotificationMarkToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :receive_comment_notification, :boolean, default: false
  end
end
