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
    pending 'in progress'
    user = create(:user)
    sign_in user

    visit properties_path

    click_on product2.title
    fill_in 'product_booking_form_date_from_s', with: '2018-05-05'
    fill_in 'product_booking_form_date_to_s', with: '2018-05-08'
    fill_in 'Guests', with: 2
    click_on I18n.t('booking_component.submit')

    expect(page).to have_content(I18n.t('booking.add.header'))
    expect(page).to have_content('3 nights, 2 persons')
    expect(page).to have_content(product2.title)
  end

  scenario 'booking as an anonymous user' do
  end
end
