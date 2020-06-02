class Event < ApplicationRecord
  require 'date'

  belongs_to :user

  validates :date, presence: true
  validate :date_future
  validates :duration, presence: true,
          numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true,
            length: { min: 5 }
  validates :description, presence: true,
            length: { min: 20}
  validates :price, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :location, presence: true

  private

  def date_future
    errors.add(:date, "la date de l'event est déjà passée") if self.date <= DateTime.now()
  end

end
