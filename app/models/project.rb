class Project < ApplicationRecord
	has_many :to_dos, dependent: :destroy

	validates :title, presence: true

	accepts_nested_attributes_for :to_dos, reject_if: :all_blank
end
