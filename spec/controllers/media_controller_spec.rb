require 'rails_helper'

RSpec.describe MediaController, type: :controller do
  before do
    sign_in
  end

  let(:valid_attributes) { FactoryGirl.attributes_for(:movie, chapter_id: FactoryGirl.create(:chapter).id) }
  let(:invalid_attributes) { { title_de: nil } }

  let(:medium) { FactoryGirl.create(:movie) }

  describe 'GET #index' do
    it 'assigns all media as @media' do
      get :index, locale: :en
      expect(assigns(:media)).to eq([medium])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested medium as @medium' do
      get :show, id: medium.to_param, locale: :en
      expect(assigns(:medium)).to eq(medium)
    end
  end

  describe 'GET #new' do
    it 'assigns a new medium as @medium' do
      get :new, locale: :en
      expect(assigns(:medium)).to be_a_new(Medium)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested medium as @medium' do
      get :edit, id: medium.to_param, locale: :en
      expect(assigns(:medium)).to eq(medium)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Medium' do
        expect {
          post :create, medium: valid_attributes, locale: :en
        }.to change(Medium, :count).by(1)
      end

      it 'assigns a newly created medium as @medium' do
        post :create, medium: valid_attributes, locale: :en
        expect(assigns(:medium)).to be_a(Medium)
        expect(assigns(:medium)).to be_persisted
      end

      it 'redirects to the created medium' do
        post :create, medium: valid_attributes, locale: :en
        expect(response).to redirect_to(media_path)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved medium as @medium' do
        post :create, medium: invalid_attributes, locale: :en
        expect(assigns(:medium)).to be_a_new(Medium)
      end

      it "re-renders the 'new' template" do
        post :create, medium: invalid_attributes, locale: :en
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { title_en: 'new title' } }

      it 'updates the requested medium' do
        put :update, id: medium.to_param, medium: new_attributes, locale: :en
        medium.reload
        expect(medium.title).to eq('new title')
      end

      it 'assigns the requested medium as @medium' do
        put :update, id: medium.to_param, medium: valid_attributes, locale: :en
        expect(assigns(:medium)).to eq(medium)
      end

      it 'redirects to the medium' do
        put :update, id: medium.to_param, medium: valid_attributes, locale: :en
        expect(response).to redirect_to(media_path)
      end
    end

    context 'with invalid params' do
      it 'assigns the medium as @medium' do
        put :update, id: medium.to_param, medium: invalid_attributes, locale: :en
        expect(assigns(:medium)).to eq(medium)
      end

      it "re-renders the 'edit' template" do
        put :update, id: medium.to_param, medium: invalid_attributes, locale: :en
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested medium' do
      medium.save
      expect {
        delete :destroy, id: medium.to_param, locale: :en
      }.to change(Medium, :count).by(-1)
    end

    it 'redirects to the media list' do
      delete :destroy, id: medium.to_param, locale: :en
      expect(response).to redirect_to(media_url)
    end
  end
end
