class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    unless column_exists? :users, :role
      add_column :users, :role, :string, default: 'user'
    end
  end
end
