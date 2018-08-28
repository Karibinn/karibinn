# frozen_string_literal: true

module Admin
  class ProductsController < AdminController
    def index
      @products = Product.all
    end

    def edit
      @product = Product.friendly.find(params[:id])
      @product.images.build
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

    def product_params
      params.require(:product).permit(:title, :description, :category_id)
    end
  end
end
