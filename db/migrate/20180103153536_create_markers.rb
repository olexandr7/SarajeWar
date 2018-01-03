class CreateMarkers < ActiveRecord::Migration[5.0]
  def change
    create_table :markers do |t|
      t.float :lat
      t.float :lng
      t.string :name
      t.string :avatar
      t.string :website
      t.string :address
      t.integer :year
      t.text :about

      t.timestamps
    end
  end
end
