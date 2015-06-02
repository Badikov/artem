class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login,                :null => false
      t.string :name,                 :null => false, :default => ''

      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token

      t.string :imei, :default => "", :null => false
      t.string :phone_number,         :null => false
      t.boolean :active, :default => true

      t.integer :login_count,         :null => false, :default => 0
      t.integer :failed_login_count,  :null => false, :default => 0
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip

      t.timestamps null: false
    end
  end
end
