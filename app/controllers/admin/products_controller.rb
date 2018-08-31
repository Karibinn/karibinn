# frozen_string_literal: true

module Admin
  class ProductsController < AdminController
    def index
      scope = if params[:type] == 'activity'
                Product.activities
              else
                Product.properties
              end

      @products = scope.eager_load(:category, :images)
    end

    def new
      @product = Product.new(specific_type: params[:type].capitalize)
      @product.build_specific
    end

    def edit
      @product = Product.friendly.find(params[:id])
    end

    def update
      @product = Product.friendly.find(params[:id])

      specific = @product.specific

      if specific.update(params_for(specific))
        flash.notice = I18n.t('admin.products.updated')
        redirect_to admin_root_path(type: specific.class.to_s.downcase)
      else
        render :edit
      end
    end

    private

    def params_for(specific)
      case specific
      when Property
        property_params
      when Activity
        activity_params
      else
        raise "Unsupported polymorphic class: #{specific.class}"
      end
    end

    def property_params
      params.require(:property).permit(
        :property_theme_id,
        {
          property_service_ids: [],
          equipment_ids: []
        }.merge(product_attributes)
      )
    end

    def activity_params
      params.require(:activity).permit(product_attributes)
    end

    def product_attributes
      {
        product_attributes:
          %i[id title_en title_fr description_en description_fr category_id]
      }
    end
  end
end
