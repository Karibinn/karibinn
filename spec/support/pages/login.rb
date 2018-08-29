# frozen_string_literal: true

module Pages
  class Login < AePageObjects::Document
    path :new_user_session

    form_for :user do
      element :email
      element :password
    end

    def login!(mail, pass)
      email.set mail
      password.set pass

      node.save_and_open_page

      node.click_on('Log in')
    end
  end
end
