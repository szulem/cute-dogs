class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :image
      t.integer :cuteness_score
      t.datetime :uploaded_at

      t.timestamps
    end
  end
end
