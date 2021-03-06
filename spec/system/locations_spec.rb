# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Location pages' do
  let(:location1) { create :location, name_en: 'Martinique' }
  let(:location2) { create :location, name_en: 'Les Saintes' }

  let!(:product1) do
    create(:product,
           :with_image,
           location: location1,
           title_en: 'Beautiful Villa',
           specific: create(:property,
                            room_types: [create(:room_type, guest_capacity: 2)])
    )
  end

  let!(:product2) do
    create(:product,
           :with_image,
           location: location2,
           title_en: 'Amazing Apartment',
           specific: create(:property,
                            room_types: [create(:room_type)]))
  end

  let!(:product3) do
    create(:product,
           :with_image,
           location: location1,
           title_en: 'Amazing Hotel',
           specific: create(:property,
                            room_types: [create(:room_type, guest_capacity: 4)])
    )
  end

  scenario 'seeing proper products on specific destination pages' do
    visit root_path

    within('nav') do
      click_on I18n.t('nav.destinations')
    end

    expect(page).to have_link(location1.name)
    expect(page).to have_link(location2.name)

    expect(page).to have_link(product1.title)
    expect(page).to have_link(product2.title)
    expect(page).to have_link(product3.title)

    click_on location1.name

    expect(page).to have_link(product1.title)
    expect(page).not_to have_link(product2.title)
    expect(page).to have_link(product3.title)

    select '4 Guests', from: 'Guests'
    click_on I18n.t('shared.search_pills.apply')

    expect(page).not_to have_link(product1.title)
    expect(page).not_to have_link(product2.title)
    expect(page).to have_link(product3.title)
  end
end
