class DeletePlansTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :plans
  end
end
