require 'rails_helper'

RSpec.describe "Posts" do
  let!(:my_post) { create(:post) }

  describe "GET /index" do
    it "returns http success" do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get post_path(my_post)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_post_path(my_post)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid attributes" do
      it "creates a new post" do
        expect do
          post posts_path, params: { post: attributes_for(:post) }
        end.to change(Post, :count).by(1)
      end

      it "redirects to the new post" do
        post posts_path, params: { post: attributes_for(:post) }
        expect(response).to redirect_to Post.last
      end
    end

    context "with invalid attributes" do
      it "does not create a new post" do
        expect do
          post posts_path, params: { post: attributes_for(:post, :invalid) }
        end.not_to change(Post, :count)
      end

      it "re-renders the new method" do
        post posts_path, params: { post: attributes_for(:post, :invalid) }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid attributes" do
      it "updates the post" do
        patch post_path(my_post), params: { post: attributes_for(:post, title: "New Title") }
        my_post.reload
        expect(my_post.title).to eq("New Title")
      end

      it "redirects to the updated post" do
        patch post_path(my_post), params: { post: attributes_for(:post) }
        expect(response).to redirect_to my_post
      end
    end

    context "with invalid attributes" do
      it "does not update the post" do
        patch post_path(my_post), params: { post: attributes_for(:post, :invalid) }
        my_post.reload
        expect(my_post.title).not_to be_nil
      end

      it "re-renders the edit method" do
        patch post_path(my_post), params: { post: attributes_for(:post, :invalid) }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "deletes the post" do
      expect { delete post_path(my_post) }.to change(Post, :count).by(-1)
    end

    it "redirects to posts#index" do
      delete post_path(my_post)
      expect(response).to redirect_to posts_path
    end
  end
end
