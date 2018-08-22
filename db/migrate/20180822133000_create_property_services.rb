class CreatePropertyServices < ActiveRecord::Migration[5.2]
  def change
    create_table :property_services do |t|
      t.string :name_en
      t.string :name_fr

      t.timestamps
    end
  end
end
