# frozen_string_literal: true

require 'rails_helper'

# TODO: last sprint change. We're not booking, we're only asking for quotations.
# Sorry.
RSpec.describe 'Booking a trip' do
  let!(:product1) do
    create(:product,
           :with_image,
           title_en: 'Beautiful Villa',
           specific: create(:property,
                            room_types: [create(:room_type, price_cents: 10000)])
    )
  end

  let!(:product2) do
    create(:product,
           :with_image,
           title_en: 'Amazing Apartment',
           specific: create(:property,
                            room_types: [create(:room_type, price_cents: 13800)]))
  end

  let!(:activity1) do
    create(:product,
           :with_image,
           title_en: 'Breath-taking ride',
           specific: create(:activity, price_cents: 5200))
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

    book_activity(activity1, date: '11-05-2018', guests: 3)

    expect(page).to have_content('3 persons')
    expect(page).to have_content('€156.00') # 52 * 3 people

    click_on I18n.t('booking_items.show.view_journey')
    click_on I18n.t('bookings.show.checkout')

    expect(page).to have_content(I18n.t('bookings.checkout.header'))
    expect(page).to have_content(product1.title)
    expect(page).to have_content(product2.title)
    expect(page).to have_content(activity1.title)

    click_on I18n.t('bookings.checkout.confirm')

    fill_in_personal_information_form

    expect(page).to have_content(I18n.t('bookings.confirmation.header'))

    visit booking_path

    expect(page).to have_content(I18n.t('bookings.empty.header'))
  end

  scenario 'booking as an anonymous user' do
    book_property product1, date_range: '05/05/2018 - 08/05/2018', guests: 4

    expect(page).to have_content(I18n.t('booking_items.show.header'))
    expect(page).to have_content('3 nights, 4 persons')
    expect(page).to have_content(product1.title)

    book_property product2, date_range: '08/05/2018 - 12/05/2018', guests: 2

    expect(page).to have_content('4 nights, 2 persons')
    expect(page).to have_content(product2.title)

    book_activity(activity1, date: '11-05-2018', guests: 3)

    expect(page).to have_content('3 persons')
    expect(page).to have_content('€156.00') # 52 * 3 people

    click_on I18n.t('booking_items.show.view_journey')

    expect(page).to have_content(product1.title)
    expect(page).to have_content(product2.title)
    expect(page).to have_content(activity1.title)

    click_on I18n.t('bookings.show.checkout')

    expect(page).to have_content(I18n.t('bookings.checkout.header'))
    expect(page).to have_content(product1.title)
    expect(page).to have_content(product2.title)

    click_on I18n.t('bookings.checkout.confirm', amount: '€238.00')

    fill_in_personal_information_form

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

  def book_activity(product, date:, guests:)
    visit activities_path

    click_on product.title

    fill_in I18n.t('booking_component.date'), with: date
    fill_in I18n.t('booking_component.number_of_people'), with: guests
    click_on I18n.t('booking_component.submit')
  end

  def fill_in_personal_information_form
    within('#new_bookings_personal_information_form') do
      fill_in 'First name', with: 'John'
      fill_in 'Last name', with: 'Smith'
      fill_in 'Email', with: 'john.smith@example.com'
      fill_in 'Phone', with: '+12 123 345 3451'
      select 'United Kingdom', from: 'Country'
      fill_in 'Number of adults', with: 3
      fill_in 'Number of children', with: 1

      click_on I18n.t('bookings.personal_information.ask_for_quotation')
    end
  end
end
