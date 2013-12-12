class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :question_id, null: false
      t.integer :anonymous_user_id, null: false

      t.timestamps
    end
  end
end
