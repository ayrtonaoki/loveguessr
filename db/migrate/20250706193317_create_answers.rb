class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.string :text
      t.boolean :correct_answer

      t.timestamps
    end
  end
end
