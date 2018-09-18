# frozen_string_literal: true

class ProductRepository
  class << self
    def search_properties(search_form)
      products = Product
                   .properties
                   .eager_load(:category, :images)

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
  end
end
