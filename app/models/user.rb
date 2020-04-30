class User < ApplicationRecord
  belongs_to :city, required: false
  has_many :gossips
end
