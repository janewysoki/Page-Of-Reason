class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.belongs_to :author, null: false, foreign_key: true
      #when we actually migrate this will create an index and that index will allow AR when it's hitting the database to retrieve that belongs_to/has_many relationships quicker
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end


