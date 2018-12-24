class AddExamIdToQuestions < ActiveRecord::Migration[5.2]
  def change
  	add_column :questions, :exam_id, :integer
  end
end
