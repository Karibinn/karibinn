# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Karibinn <noreply@karibinn.fr>'

  layout 'mailer'
end
