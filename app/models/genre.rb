# == Schema Information
#
# Table name: genres
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Genre < ApplicationRecord
  has_many :posts

  # Validations
  validates :name, presence: true
end
