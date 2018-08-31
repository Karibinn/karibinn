# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Administering products' do
  fixtures :categories
  fixtures :property_services

  let(:admin) { create :user, :admin }

  let!(:property) { create :property }
  let!(:product) { create :product, title_en: 'My product', specific: property }

  before do
    sign_in admin
  end

  scenario 'Editing a property' do
    products_page = Pages::Admin::Properties.visit

    edit_page = products_page.visit_property!('My product')

    expect(edit_page).to have_form

    products_page = edit_page.change_record!(title_en: 'New title', title_fr: 'titleu')

    expect(products_page).not_to have_property('My product')
    expect(products_page).to have_property('New title')
  end

  scenario 'Creating a new property' do
    products_page = Pages::Admin::Properties.visit

    products_page.visit_new_property_form!

  end
end