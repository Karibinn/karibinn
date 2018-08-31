class AddLocalizableFieldsToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :title, :title_en
    rename_column :products, :description, :description_en
    add_column :products, :description_fr, :text
    add_column :products, :title_fr, :string
  end
end
