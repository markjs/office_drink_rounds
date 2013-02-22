class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :inviter
      t.references :user_group
      t.string :email

      t.timestamps
    end
  end
end
