puts "\n☆★☆★☆\nmailers/user_mailer.rb\n☆★☆★☆\n\n"

class UserMailer < ApplicationMailer
  puts "\n☆★☆★☆\nmailers/user_mailer.rb\nclass UserMailer < ApplicationMailer\n☆★☆★☆\n\n"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    puts "\n☆★☆★☆\nmailers/user_mailer.rb\nclass UserMailer < ApplicationMailer\naccount_activation method\n☆★☆★☆\n\n"

    @user = user
    mail to: user.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    puts "\n☆★☆★☆\nmailers/user_mailer.rb\nclass UserMailer < ApplicationMailer\npassword_reset method\n☆★☆★☆\n\n"

    @user = user
    mail to: user.email, subject: "Password reset"
  end
end