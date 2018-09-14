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

      products.page(search_form.page).per(search_form.per_page)
    end
  end
end
