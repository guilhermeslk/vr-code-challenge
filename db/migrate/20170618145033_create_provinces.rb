class CreateProvinces < ActiveRecord::Migration[5.1]
  def change
    create_table :provinces do |t|
      t.string :name
      t.integer :upper_left_boundary_x
      t.integer :upper_left_boundary_y
      t.integer :bottom_right_boundary_x
      t.integer :bottom_right_boundary_y
    end
  end
end
