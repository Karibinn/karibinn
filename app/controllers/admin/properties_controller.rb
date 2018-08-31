# frozen_string_literal: true

module Admin
  class PropertiesController < AdminController
    def edit
      @product = Product.friendly.find(params[:id])
    end

    def update
      @product = Product.friendly.find(params[:id])

      if @product.update(product_params)
        flash.notice = I18n.t('admin.products.updated')
        redirect_to admin_products_path
      else
        render :edit
      end
    end

    private

    def property_params
      params.require(:property).permit(
        :property_theme_id, :property_service_ids, :equipment_ids,
        product_attributes: [:title_en, :title_fr, :description_en, :description_fr, :category_id],
      )
    end
  end
end
