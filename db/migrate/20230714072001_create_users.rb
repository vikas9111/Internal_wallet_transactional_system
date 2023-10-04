class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :auth_token
      t.datetime :token_expires_at

      t.timestamps
    end
  end
end
