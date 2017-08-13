class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
