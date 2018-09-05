# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Booking a trip' do
  let!(:product1) do
    create(:product,
           title_en: 'Beautiful Villa',
           specific: create(:property))
  end

  let!(:product2) do
    create(:product,
           title_en: 'Amazing Apartment',
           specific: create(:property))
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
  end

  scenario 'booking as an anonymous user' do
  end

  private

  def book_property(product, date_range:, guests:)
    visit properties_path

    click_on product.title
    fill_in 'product_booking_form_date_range_s', with: date_range
    fill_in 'Guests', with: guests
    click_on I18n.t('booking_component.submit')
  end
end
