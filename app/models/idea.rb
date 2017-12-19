class Idea < ApplicationRecord
  validates :description, presence: true
  belongs_to :user
  belongs_to :category
end
