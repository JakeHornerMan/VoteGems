class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.string :name, null:false
      t.string :image
      t.integer :score, null:false
      t.belongs_to :election, index: true,  null:false

      t.timestamps
    end
  end
end
