class Booking < ApplicationRecord
  belongs_to :user

  enum state: {
    initial: 0,
    confirmed: 4
  }
end
