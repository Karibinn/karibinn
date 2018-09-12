class CreateAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :amenities do |t|
      t.string :name_en
      t.string :name_fr
    end

    create_join_table :room_types, :amenities do |t|
      t.index [:room_type_id, :amenity_id]
    end
  end
end
