class CreateElections < ActiveRecord::Migration[6.1]
  def change
    create_table :elections do |t|
      t.string :title, null:false
      t.string :created_by
      t.boolean :ispublic, null:false
      t.string :participants

      t.timestamps
    end
  end
end
