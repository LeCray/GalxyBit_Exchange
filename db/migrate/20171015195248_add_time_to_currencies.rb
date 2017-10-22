class AddTimeToCurrencies < ActiveRecord::Migration[5.0]
  def change
    add_column :currencies, :time, :time
  end
end
