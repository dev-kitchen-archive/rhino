require 'rails_helper'

RSpec.describe NewsletterSubscriptionsController, type: :controller do
  let(:valid_attributes) { FactoryGirl.attributes_for(:newsletter_subscription).except(:language) }
  let(:invalid_attributes) { valid_attributes.merge(name: nil) }

  let(:newsletter_subscription) { FactoryGirl.create :newsletter_subscription }

  context 'as logged in user' do
    before do
      sign_in
    end

    describe 'GET #index' do
      it 'assigns all newsletter_subscriptions as @newsletter_subscriptions' do
        newsletter_subscription.save!
        get :index, locale: :en
        expect(assigns(:newsletter_subscriptions)).to eq([newsletter_subscription])
      end
    end
  end

  context 'as API user' do
    describe 'GET #index' do
      it 'does not allow access' do
        newsletter_subscription.save!
        get :index, locale: :en
        expect(response.status).to eq(302)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new NewsletterSubscription' do
          expect { post :create, locale: :en, newsletter_subscription: valid_attributes }.
            to change(NewsletterSubscription, :count).by(1)
        end

        it 'assigns a newly created newsletter_subscription as @newsletter_subscription' do
          post :create, locale: :en, newsletter_subscription: valid_attributes
          expect(assigns(:newsletter_subscription)).to be_a(NewsletterSubscription)
          expect(assigns(:newsletter_subscription)).to be_persisted
        end

        it 'returns http status 204' do
          post :create, locale: :en, newsletter_subscription: valid_attributes
          expect(response.status).to eq(204)
          expect(response.body).to eq('')
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved newsletter_subscription as @newsletter_subscription' do
          post :create, locale: :en, newsletter_subscription: invalid_attributes
          expect(response.status).to eq(422)
          expect(JSON.parse(response.body)).to eq('name' => [ "can't be blank" ])
        end
      end
    end
  end
end
