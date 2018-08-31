# frozen_string_literal: true

module Pages
  module Admin
    module Properties
      class New < AePageObjects::Document
        path :new_admin_property

        form_for :property do
          element :product_attributes_title_en
          element :product_attributes_title_fr
          element :product_attributes_description_en
          element :product_attributes_description_fr
          element :product_attributes_category_id
        end

        def create_property!(title_en:, title_fr:)
          self.product_attributes_title_en.set title_en
          self.product_attributes_title_fr.set title_fr

          self.product_attributes_description_en.set 'Lorem Ipsum Dolor Sit Amet'
          self.product_attributes_description_fr.set 'Lorem Ipsum Dolor Sit Amet'

          node.select 'Apartment', from: 'Category'

          node.check 'Room Service'
          node.check 'Swimming Pool'
          node.check 'WiFi Access'

          node.click_on 'Create Property'

          window.change_to(Pages::Admin::ProductImages)
        end
      end
    end
  end
end
