class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.datetime :date
      t.integer :user_id
      t.integer :pair_id

      t.timestamps
    end
  end
end
