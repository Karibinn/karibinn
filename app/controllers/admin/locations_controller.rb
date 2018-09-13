# frozen_string_literal: true

module Admin
  class LocationsController < AdminController
    before_action :set_location, only: [:show, :edit, :update, :destroy]

    def index
      @locations = Location.all
    end

    def show
    end

    def new
      @location = Location.new
    end

    def edit
    end

    def create
      @location = Location.new(location_params)

      if @location.save
        redirect_to admin_location_path(@location), notice: 'Location was successfully created.'
      else
        render :new
      end
    end

    def update
      if @location.update(location_params)
        redirect_to admin_location_path(@location), notice: 'Location was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @location.destroy
      redirect_to admin_locations_url, notice: 'Location was successfully destroyed.'
    end

    private

    def set_location
      @location = Location.friendly.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name_en, :name_fr, :description_en, :description_fr,
                                       :small_image, :large_image)
    end
  end
end
