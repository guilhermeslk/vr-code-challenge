class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.integer :x
      t.integer :y
      t.string :title
      t.decimal :price
      t.text :description
      t.integer :beds
      t.integer :baths
      t.integer :square_meters

      t.timestamps
    end
  end
end
