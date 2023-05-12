class AddJtiToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :jti, :string
    add_index :admins, :jti
  end
end
