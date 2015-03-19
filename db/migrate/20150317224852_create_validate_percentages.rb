class CreateValidatePercentages < ActiveRecord::Migration
  def change
    create_table :validate_percentages do |t|

      t.timestamps null: false
    end
  end
end
