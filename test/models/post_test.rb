# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_genre_id  (genre_id)
#  index_posts_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (genre_id => genres.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
