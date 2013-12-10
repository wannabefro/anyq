class CreateAnonymousUsers < ActiveRecord::Migration
  def change
    create_table :anonymous_users do |t|
      t.string :ip_address, null: false
      t.string :username, null: false
      t.string :token, null: false
      t.timestamps
    end
  end
end
