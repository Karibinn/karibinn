class RemoveEquipments < ActiveRecord::Migration[5.2]
  def change
    drop_table :equipment
    drop_table :equipment_properties
  end
end
