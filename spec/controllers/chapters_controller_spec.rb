require 'rails_helper'

RSpec.describe ChaptersController, type: :controller do
  before do
    sign_in
  end

  let(:valid_attributes) { FactoryGirl.attributes_for(:chapter) }
  let(:invalid_attributes) { { title_de: nil } }

  let(:book) { FactoryGirl.create :book }
  let(:chapter) { FactoryGirl.create :chapter, book: book }

  describe 'GET #new' do
    it 'assigns a new chapter as @chapter' do
      get :new, book_id: book.to_param, locale: :en
      expect(assigns(:chapter)).to be_a_new(Chapter)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested chapter as @chapter' do
      get :edit, id: chapter.to_param, locale: :en
      expect(assigns(:chapter)).to eq(chapter)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new chapter' do
        expect {
          post :create, chapter: valid_attributes, book_id: book.to_param, locale: :en
        }.to change(Chapter, :count).by(1)
      end

      it 'assigns a newly created chapter as @chapter' do
        post :create, chapter: valid_attributes, book_id: book.to_param, locale: :en
        expect(assigns(:chapter)).to be_a(Chapter)
        expect(assigns(:chapter)).to be_persisted
      end

      it 'redirects to the book' do
        post :create, chapter: valid_attributes, book_id: book.to_param, locale: :en
        expect(response).to redirect_to(book)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved chapter as @chapter' do
        post :create, chapter: invalid_attributes, book_id: book.to_param, locale: :en
        expect(assigns(:chapter)).to be_a_new(Chapter)
      end

      it "re-renders the 'new' template" do
        post :create, chapter: invalid_attributes, book_id: book.to_param, locale: :en
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { title_en: 'new title' } }

      it 'updates the requested chapter' do
        put :update, id: chapter.to_param, chapter: new_attributes, locale: :en
        chapter.reload
        expect(chapter.title).to eq('new title')
      end

      it 'assigns the requested chapter as @chapter' do
        put :update, id: chapter.to_param, chapter: valid_attributes, locale: :en
        expect(assigns(:chapter)).to eq(chapter)
      end

      it 'redirects to the book' do
        put :update, id: chapter.to_param, chapter: valid_attributes, locale: :en
        expect(response).to redirect_to(book)
      end
    end

    context 'with invalid params' do
      it 'assigns the chapter as @chapter' do
        put :update, id: chapter.to_param, chapter: invalid_attributes, locale: :en
        expect(assigns(:chapter)).to eq(chapter)
      end

      it "re-renders the 'edit' template" do
        put :update, id: chapter.to_param, chapter: invalid_attributes, locale: :en
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested chapter' do
      chapter.save
      expect {
        delete :destroy, id: chapter.to_param, locale: :en
      }.to change(Chapter, :count).by(-1)
    end

    it 'redirects to the book' do
      delete :destroy, id: chapter.to_param, locale: :en
      expect(response).to redirect_to(book)
    end
  end
end
