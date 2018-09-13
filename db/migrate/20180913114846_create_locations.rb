class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name_en
      t.string :name_fr
      t.string :description_en
      t.string :description_fr
      t.string :small_image
      t.string :large_image

      t.timestamps
    end
  end
end
