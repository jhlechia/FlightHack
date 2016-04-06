class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
  end
  def admin?
  self.admin == "1"
  end
end
