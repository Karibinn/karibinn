# frozen_string_literal: true

module Admin
  class AdminController < ::ApplicationController
    layout 'admin'
    before_action :authenticate!

    def authenticate!
      authenticate_user!

      redirect_to root_path unless current_user.admin?
    end
  end
end
