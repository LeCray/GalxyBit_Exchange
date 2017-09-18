# Preview all emails at http://localhost:3000/rails/mailers/client_mailer
class ClientMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/client_mailer/account_activation
  def account_activation
  	client = Client.first
    client.activation_token = Client.new_token
    ClientMailer.account_activation(client)
  end

  # Preview this email at http://localhost:3000/rails/mailers/client_mailer/password_reset
  def password_reset
    ClientMailer.password_reset
  end

  # Preview this email at http://localhost:3000/rails/mailers/client_mailer/call_request
  def call_request
    client = Client.last
    ClientMailer.call_request(client)
  end


end
