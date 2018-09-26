# frozen_string_literal: true

class FocusSectionPresenter
  def initialize
    @category = Category.order(Arel.sql('random()')).first
  end

  def category_name
    @category.name
  end

  def products
    @products ||= ProductRepository.product_picks(limit: 2).where(category: @category)
  end

  def sample_image_url
    products.flat_map(&:images).sample&.url
  end
end
