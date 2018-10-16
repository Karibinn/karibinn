# frozen_string_literal: true

Category
  .where(object_type: 'Property', name_en: 'Hotel', name_fr: 'Hôtel')
  .first_or_create!
Category
  .where(object_type: 'Property', name_en: 'Apart-Hotel', name_fr: 'Résidence Hotelière')
  .first_or_create!
Category
  .where(object_type: 'Property', name_en: 'Guest house & Bungalow', name_fr: 'Gites & Bungalow')
  .first_or_create!
Category
  .where(object_type: 'Property', name_en: 'Apartment', name_fr: 'Appartement')
  .first_or_create!
Category
  .where(object_type: 'Property', name_en: 'Villa', name_fr: 'Villa')
  .first_or_create!
Category
  .where(object_type: 'Property', name_en: 'Youth Hostel', name_fr: 'Auberge de jeunesse')
  .first_or_create!
Category
  .where(object_type: 'Property', name_en: 'Unusual', name_fr: 'Unusual')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Lover', name_fr: 'A deux')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Culture & Heritage', name_fr: 'Culture & Patrimoine')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Dicovery', name_fr: 'Découverte')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Sports & Adventure', name_fr: 'Sport & découvertes')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Well Being', name_fr: 'Bien être')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Gastronomy', name_fr: 'Gastronomie')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Arts & Entertainement', name_fr: 'Arts & Divertissement')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Unsual', name_fr: 'Insolites')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Concierge', name_fr: 'Conciergerie')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Nautisme', name_fr: 'Nautisme')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Sailing Cruise', name_fr: 'Croisiere à la voile')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Cruise liner', name_fr: 'Croisière paquebot')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Charter boat', name_fr: 'Affrètement bateau')
  .first_or_create!
Category
  .where(object_type: 'Activity', name_en: 'Culture & Heritage', name_fr: 'Culture & Patrimoine')
  .first_or_create!

Amenity
  .where(name_en: 'BBQ', name_fr: 'Barbecue')
  .first_or_create!
Amenity
  .where(name_en: 'Car park', name_fr: 'Parking')
  .first_or_create!
Amenity
  .where(name_en: 'Convertible sofa 1 place', name_fr: 'Canapé convertible 1 place')
  .first_or_create!
Amenity
  .where(name_en: 'Convertible sofa 2 places', name_fr: 'Canapé convertible 2 places')
  .first_or_create!
Amenity
  .where(name_en: 'Dishwasher', name_fr: 'Lave-vaisselle')
  .first_or_create!
Amenity
  .where(name_en: 'Equipped Kitchen', name_fr: 'Cuisine équipée')
  .first_or_create!
Amenity
  .where(name_en: 'Fridge', name_fr: 'Réfrigérateur')
  .first_or_create!
Amenity
  .where(name_en: 'Kids club', name_fr: 'Espace pour enfants')
  .first_or_create!
Amenity
  .where(name_en: 'Kitchenette', name_fr: 'Kitchenette')
  .first_or_create!
Amenity
  .where(name_en: 'Microwave', name_fr: 'Four Micro onde')
  .first_or_create!
Amenity
  .where(name_en: 'Mini fridge', name_fr: 'Mini réfrigérateur')
  .first_or_create!
Amenity
  .where(name_en: 'Mosquito net', name_fr: 'Moustiquaire')
  .first_or_create!
Amenity
  .where(name_en: 'Nautic base', name_fr: 'Base nautique')
  .first_or_create!
Amenity
  .where(name_en: 'Oven', name_fr: 'Four')
  .first_or_create!
Amenity
  .where(name_en: 'Private swimming pool', name_fr: 'Piscine privée')
  .first_or_create!
Amenity
  .where(name_en: 'Public swimming pool', name_fr: 'Piscine publique')
  .first_or_create!
Amenity
  .where(name_en: 'Seaside view', name_fr: 'Vue mer')
  .first_or_create!
Amenity
  .where(name_en: 'Seminar', name_fr: 'Séminaire')
  .first_or_create!
Amenity
  .where(name_en: 'Shared swimming pool', name_fr: 'Piscine communale')
  .first_or_create!
Amenity
  .where(name_en: 'Spa', name_fr: 'Spa')
  .first_or_create!
Amenity
  .where(name_en: 'Swimming pool', name_fr: 'Piscine')
  .first_or_create!
Amenity
  .where(name_en: 'Fan', name_fr: 'Ventilateur')
  .first_or_create!
Amenity
  .where(name_en: 'WiFi', name_fr: 'WiFi')
  .first_or_create!
Amenity
  .where(name_en: 'Washing machine', name_fr: 'Lave-linge')
  .first_or_create!
Amenity
  .where(name_en: 'Jacuzzi tub', name_fr: 'Bain à remous')
  .first_or_create!

PropertyService
  .where(name_en: 'Linen', name_fr: 'Linge de maison')
  .first_or_create!
PropertyService
  .where(name_en: 'Daily House hold', name_fr: 'Ménage quotidien')
  .first_or_create!
PropertyService
  .where(name_en: 'Weekly House hold', name_fr: 'Mén age à la semaine')
  .first_or_create!
PropertyService
  .where(name_en: 'House hold on demand', name_fr: 'Ménage à la demande')
  .first_or_create!
PropertyService
  .where(name_en: 'Restaurant on the spot', name_fr: 'Restaurant sur place')
  .first_or_create!
PropertyService
  .where(name_en: 'Safety deposit box', name_fr: 'Coffre fort')
  .first_or_create!

PropertyTheme.where(name_en: 'Hotel club').first_or_create!
PropertyTheme.where(name_en: 'Luxury').first_or_create!
PropertyTheme.where(name_en: 'Ecotourism').first_or_create!
PropertyTheme.where(name_en: 'Business').first_or_create!
PropertyTheme.where(name_en: 'Economic').first_or_create!
PropertyTheme.where(name_en: 'Well being').first_or_create!
PropertyTheme.where(name_en: 'Charm').first_or_create!

Location.where(name_en: 'Guadeloupe', name_fr: 'Guadeloupe').first_or_create!(
  description_en: <<~DESC,
    ## A Return to Guadeloupe: Tropical Life, French-Style

    The pink-tinged sky was darkening, and the air was warm and humid when my husband, Bruce,
    and I landed last February in Pointe-à-Pitre, Guadeloupe, the French Caribbean island.
    The shops and cafes in the airport were closing, but I could detect from their
    bright exteriors — decorated in an exuberant scarlet, yellow
    and chartreuse madras plaid pattern — a joie de vivre.
  DESC
  description_fr: <<~DESC
    ## A Return to Guadeloupe: Tropical Life, French-Style

    The pink-tinged sky was darkening, and the air was warm and humid when my husband, Bruce,
    and I landed last February in Pointe-à-Pitre, Guadeloupe, the French Caribbean island.
    The shops and cafes in the airport were closing, but I could detect from their
    bright exteriors — decorated in an exuberant scarlet, yellow
    and chartreuse madras plaid pattern — a joie de vivre.
DESC
)
Location.where(name_en: 'Martinique', name_fr: 'Martinique').first_or_create!
Location.where(name_en: 'Marie Galante', name_fr: 'Marie Galante').first_or_create!
Location.where(name_en: 'Les Saintes', name_fr: 'Les Saintes').first_or_create!
Location.where(name_en: 'Domincan Republic', name_fr: 'République Dominicaine').first_or_create!
Location.where(name_en: 'Sainte Lucia', name_fr: 'Sainte Lucie').first_or_create!
Location.where(name_en: 'Cuba', name_fr: 'Cuba').first_or_create!
Location.where(name_en: 'Saint-Martin', name_fr: 'Saint-Martin').first_or_create!
Location.where(name_en: 'Saint Barth', name_fr: 'Saint-Barth').first_or_create!

30.times do |i|
  puts "Seeding Property #{i + 1}/30"
  Property.transaction do
    property = Property.create!(
      property_theme: PropertyTheme.all.sample,
      property_services: PropertyService.all.sample(3)
    )

    room_types_count = rand(1..3)

    room_types_count.times do |i|
      double_beds = rand(1..3)
      single_beds = rand(1..5)

      RoomType.create!(
        property: property,
        name_en: "#{double_beds} double beds and #{single_beds} single beds",
        name_fr: "#{double_beds} lits doubles et #{single_beds} lits simples",
        description_en: Faker::Lorem.paragraph(5),
        description_fr: Faker::Lorem.paragraph(5),
        guest_capacity: rand(1..10),
        bedrooms: rand(1..4),
        single_beds: single_beds,
        double_beds: double_beds,
        baths: rand(1..4),
        amenities: Amenity.all.sample((rand * 15).ceil + 3),
        price_cents: (rand * 1000).floor + 10
      )
    end

    product = Product.create!(
      location: Location.all.sample,
      title_en: "#{Faker::HitchhikersGuideToTheGalaxy.location} in #{Faker::Address.city}",
      description_en: Faker::Lorem.paragraph(40, true, 15),
      title_fr: "Je ne parle pas français #{i + 1}",
      description_fr: <<~DESC,
        ## À cheval sur mon bidet.\n\n
        À cheval sur mon bidet* (1)\n\n
        Quand il trotte, il est parfait\n\n
        Au pas, au pas, au pas, (2)\n\n
        Au trot, au trot, au trot (3)\n\n
        Au galop, au galop, au galop ! (4)"
      DESC
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

30.times do |i|
  puts "Seeding Activity #{i + 1}/30"
  Activity.transaction do
    activity = Activity.create!(price_cents: (rand * 1000).floor + 10)

    product = Product.create!(
      location: Location.all.sample,
      title_en: "Amazing experience #{i + 1}",
      title_fr: "Je ne parle pas français #{i + 1}",
      description_en: Faker::Lorem.paragraph(40, true, 15),
      description_fr: <<~DESC,
        ## À cheval sur mon bidet.\n\n
        À cheval sur mon bidet* (1)\n\n
        Quand il trotte, il est parfait\n\n
        Au pas, au pas, au pas, (2)\n\n
        Au trot, au trot, au trot (3)\n\n
        Au galop, au galop, au galop ! (4)"
      DESC
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
