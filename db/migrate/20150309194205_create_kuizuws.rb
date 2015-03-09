class CreateKuizuws < ActiveRecord::Migration
  def change
    create_table :kuizuws do |t|
      t.integer :anumber

      t.timestamps null: false
    end
  end
end
