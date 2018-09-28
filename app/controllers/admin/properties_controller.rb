# frozen_string_literal: true

module Admin
  class PropertiesController < AdminController
    def index
      @products = ProductRepository.properties_for_cards(page: params[:page], with_images_only: false)
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
        render 'admin/properties/new'
      end
    end

    def edit
      @property = Property.find(params[:id])
      @product = @property.product
    end

    def update
      property = Property.find(params[:id])

      if property.update(property_params)
        flash.notice = I18n.t('admin.properties.updated')
        redirect_to admin_root_path
      else
        render 'admin/activities/edit'
      end
    end

    def destroy
      property = Property.find(params[:id])
      property.destroy

      flash.notice = I18n.t('admin.properties.destroyed')

      redirect_to admin_properties_path
    end

    private

    def property_params
      params.require(:property).permit(
        :property_theme_id,
        property_service_ids: [],
        product_attributes:
          %i[id real_name title_en title_fr description_en description_fr category_id location_id]
      )
    end
  end
end
