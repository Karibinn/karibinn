# frozen_string_literal: true

module Admin
  class ActivitiesController < AdminController
    def index
      @products = ProductRepository.activities_for_cards(page: params[:page])
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
        render 'admin/activities/new'
      end
    end

    def edit
      @activity = Activity.find(params[:id])
    end

    def update
      @activity = Activity.find(params[:id])

      if @activity.update(activity_params)
        flash.notice = I18n.t('admin.activities.updated')
        redirect_to admin_activities_path
      else
        render 'admin/activities/edit'
      end
    end

    def destroy
      activity = Activity.find(params[:id])
      activity.destroy

      flash.notice = I18n.t('admin.activities.destroyed')

      redirect_to admin_activities_path
    end

    private

    def activity_params
      params.require(:activity).permit(
        :price,
        product_attributes:
          %i[id real_name title_en title_fr description_en description_fr category_id location_id]
      )
    end
  end
end
