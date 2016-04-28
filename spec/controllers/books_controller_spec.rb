require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  before do
    sign_in
  end

  let(:valid_attributes) { FactoryGirl.attributes_for(:book) }
  let(:invalid_attributes) { { title_de: nil } }

  let(:book) { FactoryGirl.create(:book) }

  describe 'GET #index' do
    it 'assigns all books as @books' do
      get :index, locale: :en
      expect(assigns(:books)).to eq([book])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested book as @book' do
      get :show, id: book.to_param, locale: :en
      expect(assigns(:book)).to eq(book)
    end
  end

  describe 'GET #new' do
    it 'assigns a new book as @book' do
      get :new, locale: :en
      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested book as @book' do
      get :edit, id: book.to_param, locale: :en
      expect(assigns(:book)).to eq(book)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new book' do
        expect {
          post :create, book: valid_attributes, locale: :en
        }.to change(Book, :count).by(1)
      end

      it 'assigns a newly created book as @book' do
        post :create, book: valid_attributes, locale: :en
        expect(assigns(:book)).to be_a(Book)
        expect(assigns(:book)).to be_persisted
      end

      it 'redirects to the created book' do
        post :create, book: valid_attributes, locale: :en
        expect(response).to redirect_to(Book.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved book as @book' do
        post :create, book: invalid_attributes, locale: :en
        expect(assigns(:book)).to be_a_new(Book)
      end

      it "re-renders the 'new' template" do
        post :create, book: invalid_attributes, locale: :en
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { title_de: 'new title' } }

      it 'updates the requested book' do
        put :update, id: book.to_param, book: new_attributes, locale: :en
        book.reload
        expect(book.title_de).to eq('new title')
      end

      it 'assigns the requested book as @book' do
        put :update, id: book.to_param, book: valid_attributes, locale: :en
        expect(assigns(:book)).to eq(book)
      end

      it 'redirects to the book' do
        put :update, id: book.to_param, book: valid_attributes, locale: :en
        expect(response).to redirect_to(book)
      end
    end

    context 'with invalid params' do
      it 'assigns the book as @book' do
        put :update, id: book.to_param, book: invalid_attributes, locale: :en
        expect(assigns(:book)).to eq(book)
      end

      it "re-renders the 'edit' template" do
        put :update, id: book.to_param, book: invalid_attributes, locale: :en
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested book' do
      book.save
      expect {
        delete :destroy, id: book.to_param, locale: :en
      }.to change(Book, :count).by(-1)
    end

    it 'redirects to the books list' do
      delete :destroy, id: book.to_param, locale: :en
      expect(response).to redirect_to(books_url)
    end
  end
end
