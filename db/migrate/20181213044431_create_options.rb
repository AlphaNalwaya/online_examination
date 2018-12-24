class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :content
      t.integer :question_id

      t.timestamps
    end
  end
end
