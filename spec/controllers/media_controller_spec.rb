require 'rails_helper'

RSpec.describe MediaController, type: :controller do
  let(:valid_attributes) { FactoryGirl.attributes_for(:movie) }
  let(:invalid_attributes) { { title: nil } }

  let(:medium) { FactoryGirl.create(:movie) }

  describe 'GET #index' do
    it 'assigns all media as @media' do
      get :index
      expect(assigns(:media)).to eq([medium])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested medium as @medium' do
      get :show, id: medium.to_param
      expect(assigns(:medium)).to eq(medium)
    end
  end

  describe 'GET #new' do
    it 'assigns a new medium as @medium' do
      get :new
      expect(assigns(:medium)).to be_a_new(Medium)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested medium as @medium' do
      get :edit, id: medium.to_param
      expect(assigns(:medium)).to eq(medium)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Medium' do
        expect {
          post :create, movie: valid_attributes
        }.to change(Medium, :count).by(1)
      end

      it 'assigns a newly created medium as @medium' do
        post :create, movie: valid_attributes
        expect(assigns(:medium)).to be_a(Medium)
        expect(assigns(:medium)).to be_persisted
      end

      it 'redirects to the created medium' do
        post :create, movie: valid_attributes
        expect(response).to redirect_to(media_path)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved medium as @medium' do
        post :create, movie: invalid_attributes
        expect(assigns(:medium)).to be_a_new(Medium)
      end

      it "re-renders the 'new' template" do
        post :create, movie: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { title: 'new title' } }

      it 'updates the requested medium' do
        put :update, id: medium.to_param, movie: new_attributes
        medium.reload
        expect(medium.title).to eq('new title')
      end

      it 'assigns the requested medium as @medium' do
        put :update, id: medium.to_param, movie: valid_attributes
        expect(assigns(:medium)).to eq(medium)
      end

      it 'redirects to the medium' do
        put :update, id: medium.to_param, movie: valid_attributes
        expect(response).to redirect_to(media_path)
      end
    end

    context 'with invalid params' do
      it 'assigns the medium as @medium' do
        put :update, id: medium.to_param, movie: invalid_attributes
        expect(assigns(:medium)).to eq(medium)
      end

      it "re-renders the 'edit' template" do
        put :update, id: medium.to_param, movie: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested medium' do
      medium.save
      expect {
        delete :destroy, id: medium.to_param
      }.to change(Medium, :count).by(-1)
    end

    it 'redirects to the media list' do
      delete :destroy, id: medium.to_param
      expect(response).to redirect_to(media_url)
    end
  end
end
