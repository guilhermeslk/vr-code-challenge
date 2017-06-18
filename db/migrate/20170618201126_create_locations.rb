class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.references :property, index: true, foreign_key: true
      t.references :province, index: true, foreign_key: true
    end
  end
end
