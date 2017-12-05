require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it { should use_before_action(:pundit_authorize) }

  let!(:user) { create(:user) }
  let!(:admin) { create(:user, role: :admin) }

  describe 'POST #create' do
    it 'should not allow post #create for guests' do
      post :create
      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_user_session_path)
    end

    context 'signed in user' do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        sign_in user

        post :create, params: params
      end

      let(:params) { { post: { body: body } } }

      context 'without body' do
        let(:body) { '' }

        it 'should not create post' do
          expect(response).to be_success
          expect(user.posts.count).to eq(0)
          expect(response).to render_template('users/show') 
        end
      end

      context 'with 1 symbol' do
        let(:body) { '1' }

        it 'should not create post' do
          expect(response).to be_success
          expect(user.posts.count).to eq(0)
          expect(response).to render_template('users/show')
        end
      end

      context 'with body' do
        let(:body) { 'this is valid body' }

        it 'should create post' do
          expect(user.posts.count).to eq(1)
          expect(response).to redirect_to(user_path(user))
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:post) { create(:post, user: user) }

    it 'should not allow delete #destroy for guests' do
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to(new_user_session_path)
    end 

    context 'signed in admin' do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:admin]
        sign_in admin

        delete :destroy, params: { id: post.id }
      end

      it 'should destroy any post' do
        expect(response.status).to eq(302)
        expect(user.posts.count).to eq(0)
        expect(response).to redirect_to(user_path(user))
        expect(flash[:notice]).to eq('The post was deleted')
      end
    end

    context 'signed in user' do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        sign_in user
      end

      context 'post belongs to user' do
        before do
          delete :destroy, params: { id: post.id }
        end

        it 'should destroy post' do
          expect(response.status).to eq(302)
          expect(user.posts.count).to eq(0)
          expect(response).to redirect_to(user_path(user))
          expect(flash[:notice]).to eq('The post was deleted')
        end  
      end  
      

      context 'post is not belongs to user' do
        before do
          post.update(user: admin)

          delete :destroy, params: { id: post.id }
        end

        it 'should not destroy post' do
          expect(response.status).to eq(302)
          expect(post.user.posts.count).to eq(1)
          expect(response).to redirect_to root_path
          expect(flash[:alert]).to eq('Access denied')
        end  
      end 
    end
  end
end
