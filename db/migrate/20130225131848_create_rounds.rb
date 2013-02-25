class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :user_group
      t.references :user

      t.timestamps
    end
  end
end
