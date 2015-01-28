require 'rails_helper'

include TestFactories

describe User do

  describe "#favorited(post)" do

    before do
      @post = associated_post
      @user = authenticated_user
    end

    it "returns 'nil' if the user has not favorited the post" do
      expect(@user.favorited(@post)).to eq(nil)
    end


    it "returns the appropriate favorite if it exists" do
      post = Post.create(
        title: 'Post title',
        body: 'Post bodies must be pretty long.',
        topic: Topic.create(name: 'Topic name'),
        user: authenticated_user #new authenticated user
      )
      
      favorite = Favorite.create(
        post: post,
        user: @user #current user
      )

      expect(@user.favorited(post)).to eq(favorite)
    end
  end
end
