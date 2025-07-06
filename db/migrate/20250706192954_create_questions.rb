class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.string :text
      t.integer :question_type

      t.timestamps
    end
  end
end
