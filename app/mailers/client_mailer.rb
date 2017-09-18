class ClientMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.client_mailer.account_activation.subject
  #
  def account_activation(client)
    @client = client
    mail to: client.email, subject: "MoneyCalls Account Activation"
  end

  def call_request(client)
    @client = client
    mail to: "forexmaster@networktradingsa.co.za", subject: "New Call Request"
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.client_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
