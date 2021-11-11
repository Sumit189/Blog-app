class CreateAboutContents < ActiveRecord::Migration[6.1]
  def change
    create_table :about_contents do |t|
      t.string :about

      t.timestamps
    end
  end
end
