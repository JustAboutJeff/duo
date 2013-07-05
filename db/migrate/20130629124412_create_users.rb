class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name,            null: false
      t.string  :email,           null: false
      t.string  :gravatar_hash,   null: false
      t.string  :password_digest, null: false
      t.boolean :admin,           null: false, default: false
      t.string  :duo

      t.timestamps
    end
  end
end