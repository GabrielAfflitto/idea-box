class Idea < ApplicationRecord
  validates :description, presence: true
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :images
end
