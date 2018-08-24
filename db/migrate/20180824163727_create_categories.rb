class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name_fr
      t.string :name_en
      t.string :object_type

      t.timestamps
    end
  end
end
