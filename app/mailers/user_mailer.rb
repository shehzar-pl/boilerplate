class UserMailer < Devise::Mailer
  def reset_password_instructions(user, token, opts={})
    @user = user
    @token = token
    mail(to: @user.email, subject: 'Reset your password')
  end
end
