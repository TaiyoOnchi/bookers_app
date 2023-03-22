class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title #t.データ型 :カラム名(書き込んで $rails db:migrate)
      t.string :body  #t.データ型 :カラム名(書き込んで $rails db:migrate)    
      t.timestamps
    end
  end
end
