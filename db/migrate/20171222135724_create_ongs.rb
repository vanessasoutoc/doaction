class CreateOngs < ActiveRecord::Migration[5.1]
    def change
        create_table :ongs do |t|
            #t.string :neighborhood, limit: 99
            #t.numeric :number, limit: 10
            #t.string :street, limit: 99
            #t.string :complement, limit: 99
            #t.numeric :zipcode, limit: 8
            #t.references :city
            t.string :name, limit: 200
            t.string :name_fantasy, limit: 200
            t.string :cnpj, limit: 13
            t.string :phone, limit: 15
            t.string :email, limit: 99
            t.string :site, limit: 50

            t.timestamps
        end
    end
end
