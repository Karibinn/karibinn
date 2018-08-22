class CreateJoinTablePropertyPropertyService < ActiveRecord::Migration[5.2]
  def change
    create_join_table :properties, :property_services do |t|
      t.index [:property_id, :property_service_id], name: 'index_property_and_service'
      # t.index [:property_service_id, :property_id]
    end
  end
end
