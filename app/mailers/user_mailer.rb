class UserMailer < ApplicationMailer
  default from: 'welcome@jesternetwork.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user_email.subject
  #
  def welcome_email(user)
    @user = user
    @url = "https://odinbook1-775e707d163a.herokuapp.com/"

    mail(to: @user.email, subject: "Welcome!")
  end
end
