class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false

      t.timestamps
    end
  end
end
