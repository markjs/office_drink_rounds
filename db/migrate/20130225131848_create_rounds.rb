class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.reference :user_group
      t.reference :user

      t.timestamps
    end
  end
end
