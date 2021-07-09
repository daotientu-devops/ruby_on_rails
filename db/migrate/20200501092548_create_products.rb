class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, :precision => 8, :scale => 2  # trường price có độ lớn là 8 chữ số và số phần thập phân là 2 chữ số
             
      t.timestamps null: false
    end
  end
end
