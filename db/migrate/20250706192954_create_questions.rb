class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.string :text, null: false
      t.integer :question_type, null: false

      t.timestamps
    end
  end
end
