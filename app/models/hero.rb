class Hero < ApplicationRecord
  validates :name,presence: true, uniqueness: {scope: :token, case_sensitive: false}
  validates :name, :token, presence: true, length: {minimum: 5}

  scope :by_token, ->(token) {where(token: token)}
  scope :search, ->(term) {where('LOWER(name) LIKE?', "%#{term.downcase}%") if term.present?}
  scope :sorted_by_name, -> {order(:name)}
end
