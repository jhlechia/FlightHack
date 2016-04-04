class User < ActiveRecord::Base
  # before_save :toggle_admin
  has_many :bids
  has_many :flights

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

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
end
