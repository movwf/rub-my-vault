require 'active_record'

class CreatePasswords < ActiveRecord::Migration[6.1]
  def change
    create_table :passwords do |t|
      t.string :domain
      t.string :username
      t.string :password
      t.timestamps
    end
  end
end