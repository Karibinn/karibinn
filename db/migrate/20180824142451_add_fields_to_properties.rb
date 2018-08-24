class AddFieldsToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :guest_capacity, :integer
    add_column :properties, :bedrooms, :integer
    add_column :properties, :beds, :integer
    add_column :properties, :baths, :integer
  end
end
