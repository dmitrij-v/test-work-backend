class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.string :base_string
      t.string :substring
      t.boolean :status, default: true
      t.string :enterings
      t.timestamps
    end
  end
end
