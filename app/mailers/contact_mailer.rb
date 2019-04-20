class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  #
  def contact(message)
    @greeting = "Please find a new comment below,"
    @message = message
    mail to: "alexis.rieucau@gmail.com"
  end
end
