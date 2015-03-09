class Devise::Mailer < Devise.parent_mailer.constantize
  def welcome(user)
    mail to: user.email, subject: "Welcome", from:"admin@bucketlist.org"
  end
end