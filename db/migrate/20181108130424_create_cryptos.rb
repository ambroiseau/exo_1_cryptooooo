class CreateCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptos do |t|
      t.string :cryptoname
      t.decimal :value
      t.timestamps
    end
  end
end
