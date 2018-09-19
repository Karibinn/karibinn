# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Booking a trip' do
  let!(:product1) do
    create(:product,
           title_en: 'Beautiful Villa',
           specific: create(:property,
                            room_types: [create(:room_type, price_cents: 10000)])
           )
  end

  let!(:product2) do
    create(:product,
           title_en: 'Amazing Apartment',
           specific: create(:property,
                            room_types: [create(:room_type, price_cents: 13800)]))
  end

  let!(:activity1) do
    create(:product,
           title_en: 'Breath-taking ride',
           specific: create(:activity))
  end

  scenario 'booking as an existing user' do
    user = create(:user)
    sign_in user

    book_property product1, date_range: '05/05/2018 - 08/05/2018', guests: 2

    expect(page).to have_content(I18n.t('booking_items.show.header'))
    expect(page).to have_content('3 nights, 2 persons')
    expect(page).to have_content(product1.title)

    book_property product2, date_range: '08/05/2018 - 12/05/2018', guests: 2

    expect(page).to have_content('4 nights, 2 persons')
    expect(page).to have_content(product2.title)

    click_on I18n.t('booking_items.show.view_journey')

    expect(page).to have_content(product1.title)
    expect(page).to have_content(product2.title)

    click_on I18n.t('bookings.show.checkout')

    expect(page).to have_content(I18n.t('bookings.checkout.header'))
    expect(page).to have_content(product1.title)
    expect(page).to have_content(product2.title)

    # TODO: price
    click_on I18n.t('bookings.checkout.confirm', amount: '€238.00')

    expect(page).to have_content(I18n.t('bookings.confirmation.header'))

    visit booking_path

    expect(page).to have_content(I18n.t('bookings.empty.header'))
  end

  scenario 'booking as an anonymous user' do
    pending 'Waiting for anonymous user flow'
    book_property product1, date_range: '05/05/2018 - 08/05/2018', guests: 4

    expect(page).to have_content(I18n.t('booking_items.show.header'))
    expect(page).to have_content('3 nights, 4 persons')
    expect(page).to have_content(product1.title)

    book_property product2, date_range: '08/05/2018 - 12/05/2018', guests: 2

    expect(page).to have_content('4 nights, 2 persons')
    expect(page).to have_content(product2.title)

    click_on I18n.t('booking_items.show.view_journey')

    expect(page).to have_content(product1.title)
    expect(page).to have_content(product2.title)

    click_on I18n.t('bookings.show.checkout')

    expect(page).to have_content(I18n.t('bookings.checkout.header'))
    expect(page).to have_content(product1.title)
    expect(page).to have_content(product2.title)

    # TODO: price
    click_on I18n.t('bookings.checkout.confirm', amount: '€238.00')

    expect(page).to have_content(I18n.t('bookings.confirmation.header'))

    visit booking_path

    expect(page).to have_content(I18n.t('bookings.empty.header'))
  end

  scenario 'removing an item from cart' do
    sign_in create(:user)

    book_property product1, date_range: '05/05/2018 - 08/05/2018', guests: 2

    visit booking_path

    click_on I18n.t('bookings.show.remove_from_booking')

    expect(page).to have_content(I18n.t('bookings.show.removed_message', title: product1.title))
    expect(page).not_to have_content('3 nights, two persons')
  end

  private

  def book_property(product, date_range:, guests:)
    visit properties_path

    click_on product.title
    fill_in 'room_booking_form_date_range_s', with: date_range
    fill_in 'Guests', with: guests
    click_on I18n.t('booking_component.submit')
  end
end
