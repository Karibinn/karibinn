class UpdatePropertiesRequiredFields < ActiveRecord::Migration[5.2]
  def change
    execute 'update properties SET guest_capacity = 2, beds = 1, bedrooms = 1, baths = 1 WHERE guest_capacity IS NULL'
    change_column :properties, :guest_capacity, :integer, null: false, default: 1
    change_column :properties, :beds, :integer, null: false, default: 1
    change_column :properties, :bedrooms, :integer, null: false, default: 1
    change_column :properties, :baths, :integer, null: false, default: 1
  end
end
