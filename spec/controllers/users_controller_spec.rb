require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) { FactoryGirl.attributes_for(:user) }
  let(:invalid_attributes) { { email: nil } }
  let(:user) { FactoryGirl.create :user }

  before do
    sign_in_as(user)
  end

  describe 'GET #index' do
    it 'assigns all users as @users' do
      user.save
      get :index, locale: :en
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET #new' do
    it 'assigns a new user as @user' do
      get :new, locale: :en
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested user as @user' do
      get :edit, id: user.to_param, locale: :en
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect {
          post :create, user: valid_attributes, locale: :en
        }.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, user: valid_attributes, locale: :en
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'redirects to the created user' do
        post :create, user: valid_attributes, locale: :en
        expect(response).to redirect_to(users_path)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        post :create, user: invalid_attributes, locale: :en
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, user: invalid_attributes, locale: :en
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { email: 'asd@example.org' } }

      it 'updates the requested user' do
        put :update, id: user.to_param, user: new_attributes, locale: :en
        user.reload
        expect(user.email).to eq('asd@example.org')
      end

      it 'assigns the requested user as @user' do
        put :update, id: user.to_param, user: valid_attributes, locale: :en
        expect(assigns(:user)).to eq(user)
      end

      it 'redirects to the user' do
        put :update, id: user.to_param, user: valid_attributes, locale: :en
        expect(response).to redirect_to(users_path)
      end
    end

    context 'with invalid params' do
      it 'assigns the user as @user' do
        put :update, id: user.to_param, user: invalid_attributes, locale: :en
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        put :update, id: user.to_param, user: invalid_attributes, locale: :en
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      expect {
        delete :destroy, id: user.to_param, locale: :en
      }.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      delete :destroy, id: user.to_param, locale: :en
      expect(response).to redirect_to(users_url)
    end
  end
end
