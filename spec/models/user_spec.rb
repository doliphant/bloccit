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
      @user.favorites.build(post: @post)
      expect(@user.favorited(@post)).to eq(@user.favorites.where(post_id: @post.id).first)
    end

  end
end
