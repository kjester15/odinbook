class UserMailer < ApplicationMailer
  default from: 'welcome@jesternetwork.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user_email.subject
  #
  def welcome_email(user)
    @user = user
    @greeting = "Welcome to the Jester Network!"

    mail(to: @user.email, subject: "Welcome!")
  end
end
