class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :user
      t.references :session
      t.integer :rating
      t.string :comment

      t.timestamps null: false
    end
  end
end
