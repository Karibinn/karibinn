class ChangeColumnTypeInLocations < ActiveRecord::Migration[5.2]
  def change
    change_column :locations, :description_en, :text
    change_column :locations, :description_fr, :text
  end
end
