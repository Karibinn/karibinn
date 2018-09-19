# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Administering products' do
  fixtures :amenities
  fixtures :categories
  fixtures :property_services

  let(:admin) { create :user, :admin }

  let!(:property) { create :property }
  let!(:product) { create :product, title_en: 'My product', specific: property }

  before do
    sign_in admin
  end

  scenario 'Editing a property' do
    products_page = Pages::Admin::Properties::Index.visit

    edit_page = products_page.visit_property!('My product')

    expect(edit_page).to have_form

    products_page = edit_page.change_record!(title_en: 'New title', title_fr: 'titleu')

    expect(products_page).not_to have_property('My product')
    expect(products_page).to have_property('New title')
  end

  scenario 'Creating a new property' do
    products_page = Pages::Admin::Properties::Index.visit

    new_page = products_page.visit_new_property_form!

    images_page = new_page.create_property!(title_en: 'MyProperty', title_fr: 'MyProp')

    expect(images_page).to have_warning
    expect(page).to have_content 'Property has been created'

    click_on 'Edit Room Types'
    click_on 'New Room Type'

    within('#new_room_type') do
      fill_in :room_type_name_en, with: 'Beautiful Room with Double Bed'
      fill_in :room_type_name_fr, with: 'Double Bed'

      fill_in 'Guest capacity', with: 3
      fill_in 'Bedrooms', with: 1
      fill_in 'Single beds', with: 2
      fill_in 'Double beds', with: 1
      fill_in 'Baths', with: 1
      fill_in 'Price', with: 59
      check 'SPA'
      check 'WiFi Access'

      click_on 'Create Room type'
    end

    expect(page).to have_content 'Beautiful Room with Double Bed'

    click_on 'Edit'

    expect(page).to have_checked_field('SPA')
    expect(page).to have_checked_field('WiFi Access')

    products_page = Pages::Admin::Properties::Index.visit

    expect(products_page).to have_property('MyProperty')
  end

  scenario 'Deleting a property' do
    edit_page = Pages::Admin::Properties::Edit.visit(property)

    products_page = edit_page.delete_property!

    expect(products_page).not_to have_property('My product')
  end
end
