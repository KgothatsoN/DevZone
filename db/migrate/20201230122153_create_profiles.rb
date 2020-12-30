class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :user_id
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.string :telephone_number
      t.string :email
      t.string :about
      t.timestamps
    end
  end
end
