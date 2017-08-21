class Comment < ApplicationRecord
  belongs_to :piece
  validates :comment, length: { minimum: 2 }
end
