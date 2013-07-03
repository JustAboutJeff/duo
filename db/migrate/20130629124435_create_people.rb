class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :name,    :null => false
      t.string  :email,   :null => false
      t.string  :gravatar_hash,   :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
