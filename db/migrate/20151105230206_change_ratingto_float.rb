class ChangeRatingtoFloat < ActiveRecord::Migration
  def change
      remove_column :movies, :averageScore
      add_column :movies, :averageScore, :decimal
  end
end
