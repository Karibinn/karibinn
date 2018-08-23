# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PropertyType.where(name_en: 'Hotel').first_or_create!
PropertyType.where(name_en: 'Hotel Residence').first_or_create!
PropertyType.where(name_en: 'Holiday Home & Gites').first_or_create!
PropertyType.where(name_en: 'Apartment/Studio/Bungalow').first_or_create!
PropertyType.where(name_en: 'Individual Villa').first_or_create!
PropertyType.where(name_en: 'Camping').first_or_create!
PropertyType.where(name_en: 'Youth Hostel').first_or_create!
PropertyType.where(name_en: 'Unusual').first_or_create!


Equipment.where(name_en: 'Swimming pool').first_or_create!
Equipment.where(name_en: 'Private pool').first_or_create!
Equipment.where(name_en: 'Wifi access').first_or_create!
Equipment.where(name_en: 'On-site restaurant').first_or_create!
Equipment.where(name_en: 'Seminar room').first_or_create!
Equipment.where(name_en: 'Kids club').first_or_create!
Equipment.where(name_en: 'Nautic base').first_or_create!
Equipment.where(name_en: 'SPA').first_or_create!
Equipment.where(name_en: 'Car park').first_or_create!

PropertyService.where(name_en: 'Room service').first_or_create!
PropertyService.where(name_en: 'Home chef or Chef at home').first_or_create!
PropertyService.where(name_en: 'Meal delivery').first_or_create!
PropertyService.where(name_en: 'Beach towel').first_or_create!
PropertyService.where(name_en: 'Linens').first_or_create!
PropertyService.where(name_en: 'Laundry').first_or_create!

PropertyTheme.where(name_en: 'Hotel club').first_or_create!
PropertyTheme.where(name_en: 'Luxury').first_or_create!
PropertyTheme.where(name_en: 'Ecotourism').first_or_create!
PropertyTheme.where(name_en: 'Business').first_or_create!
PropertyTheme.where(name_en: 'Economic').first_or_create!
PropertyTheme.where(name_en: 'Well being').first_or_create!
PropertyTheme.where(name_en: 'Charm').first_or_create!

100.times do |i|
  puts "Seeding Product #{i + 1}/100"
  Property.transaction do
    property = Property.create(
      property_type: PropertyType.all.sample,
      property_theme: PropertyTheme.all.sample,
      equipments: Equipment.all.sample(5),
      property_services: PropertyService.all.sample(3)
    )

    _product = Product.create(
      title: "#{Faker::HitchhikersGuideToTheGalaxy.location} in #{Faker::Address.city}",
      description: Faker::Lorem.paragraph(10, true, 5),
      remote_images_urls: Array.new(2).map { Faker::LoremFlickr.image('1024x768', %w[caribbean beach]) },
      specific: property
    )
  end
end
