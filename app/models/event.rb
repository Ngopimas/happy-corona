class Event < ApplicationRecord
  require 'date'

  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances
  has_one_attached :photo

  validates :date, presence: true
  # validate :date_future
  validates :title, presence: true,
            length: { minimum: 5 }
  validates :description, presence: true,
            length: { minimum: 20}
  validates :price, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  private

  def date_future
    errors.add(:date, "la date de l'event est déjà passée") if self.date < DateTime.now()
  end

end
