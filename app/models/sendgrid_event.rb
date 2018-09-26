class SendgridEvent < ApplicationRecord
  validates :email, :event, :sg_event_id, :sg_message_id, presence: true
  validates :sg_event_id, :sg_message_id, uniqueness: true

  scope :find_by_email, -> (email) { where("email LIKE ?", "%#{email}%") }
  scope :find_by_event, -> (event) { where("event LIKE ?", "%#{event}%") }
  scope :find_by_user_id, -> (user_id) { where(user_id: user_id) }
  scope :find_by_category, -> (category) { where("category LIKE ?", "%#{category}%") }

  def self.filter_by(search_params)
    return find_by_user_id(search_params[:user_id]) if search_params[:user_id].present?

    find_by_email(search_params[:email]).
      find_by_event(search_params[:event]).
      find_by_category(search_params[:category])
  end

  def self.events
    all.map(&:event).uniq
  end
end
