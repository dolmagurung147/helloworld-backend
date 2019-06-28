class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :username, :dob, :sexualRepresentation, :posts

  def posts
    self.object.posts
  end
end
