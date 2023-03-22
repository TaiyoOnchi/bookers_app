class Book < ApplicationRecord
  validates :title, presence: true #titleカラムの設定
	validates :body, presence: true
end
