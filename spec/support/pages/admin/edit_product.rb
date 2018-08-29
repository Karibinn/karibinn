# frozen_string_literal: true

module Pages
  module Admin
    class EditProduct < AePageObjects::Document
      path :edit_admin_product

      form_for :product do
        element :title
      end

      def has_form?
        node.has_selector? 'form.edit_product'
      end

      def visit_edit_images!
        node.click_on I18n.t('admin.products.edit.edit_images')

        window.change_to(Pages::Admin::ProductImages)
      end

      def change_title!(new_title)
        title.set new_title

        node.click_on 'Update Product'

        window.change_to(Pages::Admin::Products)
      end
    end
  end
end
