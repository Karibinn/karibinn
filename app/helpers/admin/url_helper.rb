# frozen_string_literal: true

module Admin
  module UrlHelper
    def edit_admin_product_path(product)
      case product.specific
      when Property
        edit_admin_property_path(product.specific)
      when Activity
        nil
      end
    end
  end
end
