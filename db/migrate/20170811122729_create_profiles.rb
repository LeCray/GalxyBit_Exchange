class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :client, foreign_key: true
      t.references :account, foreign_key: true
      t.references :transaction, foreign_key: true

      t.timestamps
    end
  end
end
