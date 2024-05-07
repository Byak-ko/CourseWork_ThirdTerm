class Event < ApplicationRecord
    has_many :event_participations, dependent: :destroy
    has_many :members, through: :event_participations
end
