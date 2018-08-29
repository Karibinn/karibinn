# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Administering products' do
  let(:admin) { create :user, :admin }

  let!(:property) { create :property }
  let!(:product) { create :product, title: 'My product', specific: property }

  before do
    sign_in admin
  end

  scenario 'Editing a product' do
    products_page = Pages::Admin::Products.visit

    edit_page = products_page.visit_product!('My product')

    expect(edit_page).to have_form

    products_page = edit_page.change_title!('New title')

    expect(products_page).not_to have_product('My product')
    expect(products_page).to have_product('New title')
  end
end
