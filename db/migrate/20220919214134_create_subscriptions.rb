class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :customer, foreign_key: true
      t.references :tea, foreign_key: true
      t.string :title
      t.float :price
      t.integer :frequency
      t.boolean :active, default: true
    end
  end
end
