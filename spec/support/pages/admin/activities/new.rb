# frozen_string_literal: true

module Pages
  module Admin
    module Activities
      class New < AePageObjects::Document
        path :new_admin_activity

        form_for :activity do
          element :product_attributes_title_en
          element :product_attributes_title_fr
          element :product_attributes_description_en
          element :product_attributes_description_fr
          element :product_attributes_category_id
        end

        def create_activity!(title_en:, title_fr:)
          self.product_attributes_title_en.set title_en
          self.product_attributes_title_fr.set title_fr

          self.product_attributes_description_en.set 'Lorem Ipsum Dolor Sit Amet'
          self.product_attributes_description_fr.set 'Lorem Ipsum Dolor Sit Amet'

          node.click_on 'Create Activity'

          window.change_to(Pages::Admin::ProductImages)
        end
      end
    end
  end
end
