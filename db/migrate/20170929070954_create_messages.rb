class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :text
      t.boolean :important, default: true

      t.timestamps
    end
  end
end
