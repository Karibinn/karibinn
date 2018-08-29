# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authorizing as an admin' do
  scenario 'when trying to log in as a non-admin' do
    user = create :user

    visit admin_root_path

    login_page = Pages::Login.new

    login_page.login!(user.email, user.password)

    expect(page).to have_current_path(root_path)
  end

  scenario 'when trying to log in as an admin' do
    user = create :user, :admin

    visit admin_root_path

    login_page = Pages::Login.new

    login_page.login!(user.email, user.password)

    expect(page).to have_current_path(admin_root_path)
  end
end
