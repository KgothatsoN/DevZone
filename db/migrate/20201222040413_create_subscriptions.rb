class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.decimal :price
      t.timestamps
    end
  end
end
