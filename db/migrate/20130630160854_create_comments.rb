class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      # commentable - некая виртуальная модель которой будет принадлежать каждый коммент
      t.integer :commentable_id
      t.string  :commentable_type # Item or BlogPost

      t.timestamps
    end
  end
end
