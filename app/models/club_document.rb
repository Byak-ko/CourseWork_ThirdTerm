class ClubDocument < ApplicationRecord
    belongs_to :member
    has_one_attached :document
end

