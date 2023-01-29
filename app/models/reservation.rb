class Reservation < ApplicationRecord
    belongs_to :schedule, primary_key: :id, foreign_key: :schedule_id
    belongs_to :sheet, primary_key: :id, foreign_key: :sheet_id
    validates :schedule_id, presence: true
    validates :email, presence: true
    validates :name, presence: true
    validates :sheet_id, presence: true
    validates :date, presence: true
end
