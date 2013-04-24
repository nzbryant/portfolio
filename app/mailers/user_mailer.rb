class UserMailer < ActionMailer::Base
  default from: "nzbryant@yahoo.com"

  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/register/#{user.code}"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

  # def reset_email(user)
  # 	@user = user@url = "http://localhost:3000/register/#{@user.code}"

 #  	@user.code = SecureRandom.urlsafe_base64
	# @user.expires_at = DateTime.now + 1
	# @user.save


end
