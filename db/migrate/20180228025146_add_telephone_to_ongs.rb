class AddTelephoneToOngs < ActiveRecord::Migration[5.1]
    def change
        add_column :ongs, :telephone, :string, limit: 20
    end
end
