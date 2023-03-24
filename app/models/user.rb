class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  def self.from_google(email:, full_name:, uid:, avatar_url:, provider:)
    create_with(uid: uid, provider: provider).find_or_create_by!(email: email)
  end

  def password_required?
    # If the user is signing in with Google, bypass the password validation
    return false if provider == "google"
    # Otherwise, perform the default password validation
    super
  end

  def self.from_omniauth(auth)
    name_split = auth.info.name.split(" ")
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0, 20])

    user
  end
end
