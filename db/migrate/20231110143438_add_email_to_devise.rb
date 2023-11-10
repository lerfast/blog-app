class AddEmailToDevise < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :email, :string
  end
end
