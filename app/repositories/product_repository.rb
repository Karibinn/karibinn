# frozen_string_literal: true

class ProductRepository
  LIMIT = 4

  class << self
    def search_properties(search_form)
      products = eager_loaded_properties

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

      if search_form.phrase.present?
        products = products.where(
          'title_en ILIKE ? OR title_fr ILIKE ?',
          "%#{search_form.phrase}%",
          "%#{search_form.phrase}%")
      end

      products.distinct.order(id: :desc).page(search_form.page)
    end

    def product_picks(limit: LIMIT)
      Product
        .all
        .joins(:images)
        .preload(:category, :images, :location, :activity, property: :room_types)
        .order(Arel.sql('random()'))
        .limit(limit)
    end

    def properties_for_cards(page: nil, with_images_only: true)
      eager_loaded_properties(with_images_only: with_images_only).page(page)
    end

    def activities_for_cards(page: nil, with_images_only: true)
      eager_loaded_activities(with_images_only: with_images_only).page(page)
    end

    def properties_for_spacer
      @properties = eager_loaded_properties
                      .order(Arel.sql('random()'))
                      .limit(LIMIT)
    end

    def activities_for_spacer
      eager_loaded_activities
        .order(Arel.sql('random()'))
        .limit(LIMIT)
    end

    def activities_at_location(location_ids:)
      activities_for_spacer.where(location_id: location_ids)
    end

    def eager_loaded_properties(with_images_only: true)
      scope = Product
                .properties
                .preload(:category, :images, :location, property: :room_types)

      if with_images_only
        scope.joins(:images)
      else
        scope
      end
    end

    def eager_loaded_activities(with_images_only: true)
      scope = Product
                .activities
                .preload(:category, :images, :activity, :location)

      if with_images_only
        scope.joins(:images)
      else
        scope
      end
    end
  end
end
