class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name, required: true
      t.string :description
      t.string :image_url
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
