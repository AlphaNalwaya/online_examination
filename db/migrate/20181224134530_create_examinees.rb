class CreateExaminees < ActiveRecord::Migration[5.2]
  def change
    create_table :examinees do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :total_marks
      t.integer :obtain_marks

      t.timestamps
    end
  end
end
