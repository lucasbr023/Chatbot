class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |l|
      l.string :link
    end
  end
end
