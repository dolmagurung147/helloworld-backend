class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :postText, :dateTimePosted, :postLikes, :postComments

  def postLikes
    self.object.likes
  end

  def postComments
    self.object.comments
  end
  
end
