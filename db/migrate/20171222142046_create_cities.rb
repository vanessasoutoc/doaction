class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name, limit: 99
      t.string :uf, limit: 2
      t.numeric :ibge_code, limit: 10
      t.float :area
      t.string :lat, limit: 35
      t.string :lng, limit: 35

      t.timestamps
    end
  end
end