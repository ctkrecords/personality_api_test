class CreatePersonalityTraits < ActiveRecord::Migration[5.2]
  def change
    create_table :personality_traits do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
