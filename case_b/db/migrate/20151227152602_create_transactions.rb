class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :bankaccount_id, default: 0, null: false
      t.decimal :amount, precision: 10, scale: 2, default: 0, null: false
      t.text :comment

      t.timestamps null: false
    end

    add_index :transactions, :bankaccount_id
  end
end
