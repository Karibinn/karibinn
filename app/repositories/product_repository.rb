# frozen_string_literal: true

class ProductRepository
  LIMIT = 4

  class << self
    def search_properties(search_form)
      products = Product
                   .properties
                   .eager_load(:category, :images, property: :room_types)

      if search_form.guests.present?
        products = products
                     .joins(property: :room_types)
                     .where('room_types.guest_capacity >= ?', search_form.guests)
      end

      if search_form.category_id.present?
        products = products.where(category_id: search_form.category_id)
      end

      if search_form.location_slug.present?
        products = products.joins(:location).where(locations: { slug: search_form.location_slug })
      end

      products.page(search_form.page)
    end

    def product_picks
      Product
        .all
        .eager_load(:category, :images, property: :room_types)
        .order(Arel.sql('random()'))
        .limit(LIMIT)
    end

    def properties_for_cards(page: nil)
      @properties = eager_loaded_properties.page(page)
    end

    def properties_for_spacer
      @properties = eager_loaded_properties
                      .order(Arel.sql('random()'))
                      .limit(LIMIT)
    end

    def activities_for_spacer
      Product
        .activities
        .eager_load(:category, :images)
        .order(Arel.sql('random()'))
        .limit(LIMIT)
    end

    def activities_at_location(location_ids:)
      activities_for_spacer.where(location_id: location_ids)
    end

    private

    def eager_loaded_properties
      Product
        .properties
        .eager_load(:category, :images, property: :room_types)
    end
  end
end
