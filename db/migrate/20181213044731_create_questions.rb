class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :answer
      t.integer :marks

      t.timestamps
    end
  end
end
