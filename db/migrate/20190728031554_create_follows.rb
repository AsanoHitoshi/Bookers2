class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|

      t.timestamps
      t.integer :user_id
      t.integer :follow_id
    end
  end
end
