class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :exam_id
      t.integer :user_id
      t.integer :score
      t.integer :max_score

      t.timestamps
    end
  end
end
