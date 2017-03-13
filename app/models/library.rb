class Library < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum:75 }
  validates :floor_count, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :floor_area, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
end
