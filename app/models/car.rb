class Car < ApplicationRecord
  belongs_to :person
  validates :year, presence: true
  validates :model, presence: true
  validates :make, presence: true
  validates :price, presence: true
  validates :person_id, presence: true

end
