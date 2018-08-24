class RemovePropertyTypes < ActiveRecord::Migration[5.2]
  def change
    drop_table :property_types
  end
end
