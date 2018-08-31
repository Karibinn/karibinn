# frozen_string_literal: true

module Admin
  class ActivitiesController < AdminController
    def index
      @products = Product.activities.eager_load(:category, :images)
    end

    def new
      @activity = Activity.new(product: Product.new)
    end

    def create
      @activity = Activity.new(activity_params)

      if @activity.save
        flash.notice = I18n.t('admin.activities.created')
        redirect_to admin_product_product_images_path(@activity.product)
      else
        render :new
      end
    end

    def edit
      @activity = Activity.find(params[:id])
    end

    def update
      activity = Activity.find(params[:id])

      if activity.update(activity_params)
        flash.notice = I18n.t('admin.activities.updated')
        redirect_to admin_activities_path
      else
        render :edit
      end
    end

    private

    def activity_params
      params.require(:activity).permit(
        product_attributes:
          %i[id title_en title_fr description_en description_fr category_id]
      )
    end
  end
end
