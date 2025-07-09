class CreateQuizzes < ActiveRecord::Migration[7.2]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :owner_id
      t.integer :guest_id

      t.timestamps
    end

    add_foreign_key :quizzes, :users, column: :owner_id
    add_foreign_key :quizzes, :users, column: :guest_id
  end
end
