class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :user
      t.references :session
      t.integer :rating
      t.string :comment

      t.timestamps null: false
    end

    add_index :feedbacks, [:user_id, :session_id]
    add_index :feedbacks, :created_at
  end
end
