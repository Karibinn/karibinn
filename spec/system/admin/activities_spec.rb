# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Administering activities' do
  fixtures :categories

  let(:admin) { create :user, :admin }

  let!(:activity) { create :activity }
  let!(:product) do
    create :product,
           title_en: 'My product',
           specific: activity,
           category: categories(:trek)
  end

  before do
    sign_in admin
  end

  scenario 'Editing a activity' do
    products_page = Pages::Admin::Activities::Index.visit

    edit_page = products_page.visit_activity!('My product')

    expect(edit_page).to have_form

    products_page = edit_page.change_record!(
      title_en: 'New title',
      title_fr: 'titleu',
      category: categories(:excursion).name
    )

    expect(products_page).not_to have_activity('My product')
    expect(products_page).to have_activity('New title')

    expect(page).to have_content(categories(:excursion).name)
  end

  scenario 'Creating a new activity' do
    products_page = Pages::Admin::Activities::Index.visit

    new_page = products_page.visit_new_activity_form!

    images_page = new_page.create_activity!(
      title_en: 'MyActivity', title_fr: 'MyAct'
    )

    expect(images_page).to have_warning
    expect(page).to have_content 'Activity has been created'

    products_page = Pages::Admin::Activities::Index.visit

    expect(products_page).to have_activity('MyActivity')
  end
end
