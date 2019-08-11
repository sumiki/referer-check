class CreateEmailHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :email_histories do |t|
      t.string :email
      t.integer :event
      t.json :reason
    end
  end
end
