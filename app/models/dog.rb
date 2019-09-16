class Dog < ApplicationRecord
  validates_uniqueness_of :image

  acts_as_votable
end
