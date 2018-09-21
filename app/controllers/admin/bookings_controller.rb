module Admin
  class BookingsController < AdminController
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

    def index
      @bookings = Booking.confirmed.order(id: :desc).page(params[:page])
    end

    def show
      @items = @booking.items.eager_load(:room_type, product: %i[images activity]).order(checkin_date: :asc)
    end

    private

    def set_booking
      @booking = Booking.find(params[:id])
    end
  end
end
