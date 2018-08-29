# frozen_string_literal: true

module Pages
  module Admin
    class Products < AePageObjects::Document
      path :admin_root

      def visit_product!(product_name)
        node.click_on product_name

        window.change_to(Pages::Admin::EditProduct)
      end

      def has_product?(product_name)
        node.has_content?(product_name)
      end
    end
  end
end
