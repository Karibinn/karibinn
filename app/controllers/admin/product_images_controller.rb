# frozen_string_literal: true

module Admin
  class ProductImagesController < AdminController
    before_action :set_product

    def index
      @product_images = @product.images
    end

    def create
      image = @product.images.create(image: params[:file])

      respond_to do |format|
        format.json { render json: image }
      end
    end

    def destroy
      @product_image = @product.images.find(params[:id])

      @product_image.destroy

      redirect_to action: :index
    end

    private

    def set_product
      @product = Product.friendly.find(params[:product_id])
    end
  end
end
