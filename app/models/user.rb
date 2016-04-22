class User < ActiveRecord::Base
  has_many :bids
  has_many :flights
  attr_accessor :remember_token
  before_save { self.username = username.downcase }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png", storage: :s3, bucket: 'flighthack',  s3_protocol: 'http', :s3_credentials => {
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
      }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

    # def toggle_admin
    #   if self.admin == true
    #     self.toggle!(:admin)
    #   end
    # end

  #Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

private

  def toggle_true
    if params[:admin] == "1"
      self.admin == true
    end
  end
end
