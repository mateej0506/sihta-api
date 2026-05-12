class CreatePonudas < ActiveRecord::Migration[8.1]
  def change
    create_table :ponudas do |t|
      t.string :naziv
      t.string :lokacija
      t.float :lat
      t.float :lng
      t.string :vrijeme
      t.string :satnica
      t.string :placanje

      t.timestamps
    end
  end
end
