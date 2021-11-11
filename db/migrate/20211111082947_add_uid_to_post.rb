class AddUidToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :uid, :string
  end
end
