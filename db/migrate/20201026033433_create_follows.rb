class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.string :follower
      t.string :followed

      t.timestamps
    end
  end
end
