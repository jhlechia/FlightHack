class User < ActiveRecord::Base
  attr_accessor :remember_token
  # before_save :toggle_admin
  has_many :bids
  has_many :flights

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def remember
    self.remember_token = ...
    update_attribute(:remember_digest, ...)
  end

  private

    # def toggle_admin
    #   if self.admin == true
    #     self.toggle!(:admin)
    #   end
    # end

    def toggle_true
      if params[:admin] == "1"
        self.admin == true
      end
    end

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
end
