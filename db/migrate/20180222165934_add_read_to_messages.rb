class AddReadToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :read, :boolean, default: nil
  end
end
