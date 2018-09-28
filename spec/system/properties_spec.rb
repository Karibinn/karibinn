# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Property pages' do
  let(:location1) { create :location, name_en: 'Martinique' }
  let(:location2) { create :location, name_en: 'Les Saintes' }
  let(:category1) { create :category, object_type: 'Property', name_en: 'Villas' }
  let(:category2) { create :category, object_type: 'Property', name_en: 'Apartment' }

  let!(:product1) do
    create(:product,
           :with_image,
           category: category1,
           location: location1,
           title_en: 'Beautiful Villa',
           specific: create(:property,
                            room_types: [create(:room_type)])
    )
  end

  let!(:product2) do
    create(:product,
           :with_image,
           category: category2,
           location: location2,
           title_en: 'Amazing Apartment',
           specific: create(:property,
                            room_types: [create(:room_type)]))
  end

  scenario 'seeing proper products when filtering' do
    visit root_path

    within('nav') do
      click_on I18n.t('nav.properties')
    end

    expect(page).to have_link(product1.title)
    expect(page).to have_link(product2.title)

    select 'Villas', from: 'Home type'
    click_on I18n.t('shared.search_pills.apply')

    expect(page).to have_link(product1.title)
    expect(page).not_to have_link(product2.title)
  end
end
