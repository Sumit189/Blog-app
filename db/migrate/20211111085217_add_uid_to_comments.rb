class AddUidToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :uid, :string
  end
end
