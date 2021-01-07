class User < ApplicationRecord
	has_secure_password

	validates :name, {presence: true}
	validates :email, {presence: true, uniqueness: true}

	has_many :following_relationship, foreign_key: "follower_id", class_name: "FollowRelationship", dependent: :destroy
	has_many :followings, through: :following_relationships
	has_many :follower_relationship, foreign_key: "following_id", class_name: "FollowRelationship", dependent: :destroy
	has_many :followers, through: :follower_relationships

	def posts
		return Post.where(user_id: self.id)
	end
end
