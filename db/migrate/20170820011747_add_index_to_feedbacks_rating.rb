class AddIndexToFeedbacksRating < ActiveRecord::Migration
  def change
    add_index :feedbacks, [:rating, :created_at]
  end
end
