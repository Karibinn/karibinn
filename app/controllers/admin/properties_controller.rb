# frozen_string_literal: true

module Admin
  class PropertiesController < AdminController
    def index
      @products = Product.properties.eager_load(:category, :images)
    end

    def new
      @property = Property.new(product: Product.new)
    end

    def create
      @property = Property.new(property_params)

      if @property.save
        flash.notice = I18n.t('admin.properties.created')
        redirect_to admin_product_product_images_path(@property.product)
      else
        render :new
      end
    end

    def edit
      @property = Property.find(params[:id])
    end

    def update
      property = Property.find(params[:id])

      if property.update(property_params)
        flash.notice = I18n.t('admin.properties.updated')
        redirect_to admin_root_path
      else
        render :edit
      end
    end

    private

    def property_params
      params.require(:property).permit(
        :guest_capacity, :bedrooms, :beds, :baths,
        :property_theme_id,
        property_service_ids: [],
        equipment_ids: [],
        product_attributes:
          %i[id title_en title_fr description_en description_fr category_id]
      )
    end
  end
end
