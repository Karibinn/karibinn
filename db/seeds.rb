# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PropertyType.first_or_create(name_en: 'Hotel')
PropertyType.first_or_create(name_en: 'Hotel Residence')
PropertyType.first_or_create(name_en: 'Holiday Home & Gites')
PropertyType.first_or_create(name_en: 'Apartment/Studio/Bungalow')
PropertyType.first_or_create(name_en: 'Individual Villa')
PropertyType.first_or_create(name_en: 'Camping')
PropertyType.first_or_create(name_en: 'Youth Hostel')
PropertyType.first_or_create(name_en: 'Unusual')


Equipment.first_or_create(name_en: 'Swimming pool')
Equipment.first_or_create(name_en: 'Private pool')
Equipment.first_or_create(name_en: 'Wifi access')
Equipment.first_or_create(name_en: 'On-site restaurant')
Equipment.first_or_create(name_en: 'Seminar room')
Equipment.first_or_create(name_en: 'Kids club')
Equipment.first_or_create(name_en: 'Nautic base')
Equipment.first_or_create(name_en: 'SPA')
Equipment.first_or_create(name_en: 'Car park')

PropertyService.first_or_create(name_en: 'Room service')
PropertyService.first_or_create(name_en: 'Home chef or Chef at home')
PropertyService.first_or_create(name_en: 'Meal delivery')
PropertyService.first_or_create(name_en: 'Beach towel')
PropertyService.first_or_create(name_en: 'Linens')
PropertyService.first_or_create(name_en: 'Laundry')

PropertyTheme.first_or_create(name_en: 'Hotel club')
PropertyTheme.first_or_create(name_en: 'Luxury')
PropertyTheme.first_or_create(name_en: 'Ecotourism')
PropertyTheme.first_or_create(name_en: 'Business')
PropertyTheme.first_or_create(name_en: 'Economic')
PropertyTheme.first_or_create(name_en: 'Well being')
PropertyTheme.first_or_create(name_en: 'Charm')

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
