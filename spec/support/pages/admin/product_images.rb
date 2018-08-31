# frozen_string_literal: true

module Pages
  module Admin
    class ProductImages < AePageObjects::Document
      path :admin_product_product_images

      def has_warning?
        node.has_content? I18n.t('admin.product_images.index.no_images')
      end
    end
  end
end
