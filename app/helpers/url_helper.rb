# frozen_string_literal: true

module UrlHelper
  def path_for_product(product)
    if product.property?
      property_path(product)
    else
      activity_path(product)
    end
  end
end
