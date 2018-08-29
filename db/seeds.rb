# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# TODO: remove this when we have data
Property.delete_all
Product.delete_all

Category.where(object_type: 'Property', name_en: 'Hotel').first_or_create!
Category.where(object_type: 'Property', name_en: 'Hotel Residence').first_or_create!
Category.where(object_type: 'Property', name_en: 'Holiday Home & Gites').first_or_create!
Category.where(object_type: 'Property', name_en: 'Apartment').first_or_create!
Category.where(object_type: 'Property', name_en: 'Studio').first_or_create!
Category.where(object_type: 'Property', name_en: 'Bungalow').first_or_create!
Category.where(object_type: 'Property', name_en: 'Individual Villa').first_or_create!
Category.where(object_type: 'Property', name_en: 'Camping').first_or_create!
Category.where(object_type: 'Property', name_en: 'Youth Hostel').first_or_create!
Category.where(object_type: 'Property', name_en: 'Unusual').first_or_create!

Category.where(object_type: 'Activity', name_en: 'Excursion').first_or_create!
Category.where(object_type: 'Activity', name_en: 'Sport').first_or_create!
Category.where(object_type: 'Activity', name_en: 'Art').first_or_create!
Category.where(object_type: 'Activity', name_en: 'Trek').first_or_create!
Category.where(object_type: 'Activity', name_en: 'Culture').first_or_create!

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

30.times do |i|
  puts "Seeding Activity #{i + 1}/30"
  Activity.transaction do
    activity = Activity.create!

    product = Product.create!(
      title: "Amazing experience #{i + 1}",
      description: Faker::Lorem.paragraph(40, true, 15),
      specific: activity,
      category: Category.where(object_type: 'Activity').sample
    )

    3.times do
      ProductImage.create!(
        product: product,
        remote_image_url: Faker::LoremFlickr.image('1280x580',
                                                   %w[caribbean adventure]),
        description: Faker::Lorem.paragraph(3)
      )
    end
  end
end

30.times do |i|
  puts "Seeding Property #{i + 1}/30"
  Property.transaction do
    property = Property.create!(
      property_theme: PropertyTheme.all.sample,
      equipments: Equipment.all.sample(5),
      property_services: PropertyService.all.sample(3),
      guest_capacity: rand(1..10),
      bedrooms: rand(1..4),
      beds: rand(1..8),
      baths: rand(1..4)
    )

    product = Product.create!(
      title: "#{Faker::HitchhikersGuideToTheGalaxy.location} in #{Faker::Address.city}",
      description: Faker::Lorem.paragraph(40, true, 15),
      specific: property,
      category: Category.where(object_type: 'Property').sample
    )

    3.times do
      ProductImage.create!(
        product: product,
        remote_image_url: Faker::LoremFlickr.image('1280x580',
                                                   %w[caribbean beach]),
        description: Faker::Lorem.paragraph(3)
      )
    end
  end
end

