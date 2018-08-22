class CreateJoinTablePropertyEquipment < ActiveRecord::Migration[5.2]
  def change
    create_join_table :properties, :equipment do |t|
      t.index [:property_id, :equipment_id]
      # t.index [:equipment_id, :property_id]
    end
  end
end
