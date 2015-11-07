class ChangeRatingtoFloat < ActiveRecord::Migration
  def change
      remove_column :Movies, :averageScore
      add_column :Movies, :averageScore, :decimal
  end
end
