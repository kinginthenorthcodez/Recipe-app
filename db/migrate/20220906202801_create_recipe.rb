class CreateRecipe < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :preparation_time, precision: 10, scale: 2, default: 0
      t.decimal :cooking_time, precision: 10, scale: 2, default: 0
      t.string :description
      t.boolean :public, default: false 
      t.references :user, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
