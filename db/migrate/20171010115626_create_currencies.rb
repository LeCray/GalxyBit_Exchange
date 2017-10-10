class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies do |t|
      t.integer :currency_type
      t.float :value
      t.date :date

      t.timestamps
    end
  end
end
