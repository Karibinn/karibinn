class RenameDateFromAndDateToToCheckinAndCheckoutInBookingItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :booking_items, :date_from, :checkin_date
    rename_column :booking_items, :date_to, :checkout_date
  end
end
