class CreateAddresses < ActiveRecord::Migration[5.1]
    def change
        create_table :addresses do |t|
            t.string :street, limit: 200
            t.string :neighborhood, limit: 99
            t.integer :number
            t.string :complement, limit: 200
            t.integer :zipcode
            t.references :city, foreign_key: true
            #t.references :ong, foreign_key: true
            t.references :user, foreign_key: true

            t.timestamps
        end
    end
end
