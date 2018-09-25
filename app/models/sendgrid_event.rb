class SendgridEvent < ApplicationRecord
  validates :email, :event, presence: true

  scope :find_by_email, -> (email) { where("email LIKE ?", "%#{email}%") }
  scope :find_by_event, -> (event) { where("event LIKE ?", "%#{event}%") }

  def self.filter_by(email, event)
    find_by_email(email).find_by_event(event)
  end
end
