# frozen_string_literal: true

module Admin
  class RoomTypesController < AdminController
    before_action :set_property
    before_action :set_room_type, only: [:edit, :update, :destroy]

    def index
      @room_types = @property.room_types.order(:guest_capacity)
    end

    def new
      @room_type = @property.room_types.build
    end

    def edit
    end

    def create
      @room_type = @property.room_types.build(room_type_params)

      if @room_type.save
        redirect_to admin_property_room_types_path(@property),
                    notice: 'Room type was successfully created.'
      else
        render 'admin/room_types/new'
      end
    end

    def update
      if @room_type.update(room_type_params)
        redirect_to admin_property_room_types_path(@property),
                    notice: 'Room type was successfully updated.'
      else
        render 'admin/room_types/edit'
      end
    end

    def destroy
      @room_type.destroy

      redirect_to admin_property_room_types_url(@property),
                  notice: 'Room type was successfully destroyed.'
    end

    private

    def set_property
      @property = Property.find(params[:property_id])
      @product = @property.product
    end

    def set_room_type
      @room_type = @property.room_types.find(params[:id])
    end

    def room_type_params
      params.require(:room_type).permit(
        :name_en, :name_fr, :guest_capacity, :bedrooms, :single_beds, :double_beds, :baths,
        amenity_ids: []
      )
    end
  end
end
