class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.string :category
      t.text :revenue_model
      t.integer :pricing
      t.date :start_date
      t.date :end_date
      t.integer :minimum_duration
      t.text :application_criteria

      t.timestamps
    end
  end
end
