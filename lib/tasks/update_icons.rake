# frozen_string_literal: true

task :update_icons do
  Amenity.where(name_en: 'Wifi access').destroy_all

  Amenity.where(name_en: 'Pool')&.update(name_en: 'Swimming pool')
  Amenity.where(name_en: 'Shared pool')&.update(name_en: 'Shared swimming pool')
  Amenity.where(name_en: 'Private pool')&.update(name_en: 'Private swimming pool')
  Amenity.find_by(name_en: 'Equiped Kitchen')&.update(name_en: 'Equipped kitchen')

  def icon_file(name)
    Pathname.new(
      File.join(Rails.root, 'app', 'assets', 'images', 'amenities', "#{name}.svg")
    ).open
  end

  def default_update_amenity(amenity)
    icon_file_name = amenity.name_en.downcase.tr(' ', '-')

    amenity.update!(icon: icon_file(icon_file_name))
  rescue Errno::ENOENT
    puts "Icon #{icon_file_name} doesnt exist for amenity #{amenity.name_en}"
  end

  Amenity.find_each do |amenity|
    default_update_amenity(amenity)
  end
end
