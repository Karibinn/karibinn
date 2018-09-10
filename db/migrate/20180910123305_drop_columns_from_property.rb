class DropColumnsFromProperty < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :guest_capacity
    remove_column :properties, :beds
    remove_column :properties, :bedrooms
    remove_column :properties, :baths
  end
end
