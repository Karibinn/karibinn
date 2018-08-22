class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.references :property_type
      t.references :property_theme

      t.timestamps
    end
  end
end
