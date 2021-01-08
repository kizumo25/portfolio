class User < ApplicationRecord
	has_secure_password

	has_many :following_relationships, foreign_key: "follower_id", class_name: "FollowRelationship", dependent: :destroy
	has_many :followings, through: :following_relationships
	has_many :follower_relationship, foreign_key: "following_id", class_name: "FollowRelationship", dependent: :destroy
	has_many :followers, through: :follower_relationships

	validates :name, {presence: true}
	validates :email, {presence: true, uniqueness: true}

	def posts
		return Post.where(user_id: self.id)
	end

	def following?(other_user)
		self.followings.include?(other_user)
	end

	def follow(other_user)
		self.following_relationship.create(following_id: other_user.id)
	end

	def unfollow(other_user)
		self.following_relationship.find_by(following_id: other_user.id).destroy
	end

end
