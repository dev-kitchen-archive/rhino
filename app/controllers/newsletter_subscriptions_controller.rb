class NewsletterSubscriptionsController < ApplicationController
  skip_before_action :require_login, only: :create
  skip_before_action :verify_authenticity_token, only: :create

  def index
    @newsletter_subscriptions = NewsletterSubscription.all
  end

  def create
    @newsletter_subscription = NewsletterSubscription.new(newsletter_subscription_params)
    @newsletter_subscription.language = I18n.locale
    if @newsletter_subscription.save
      render nothing: true, status: :no_content
    else
      render json: @newsletter_subscription.errors, status: 422
    end
  end

  private

  def newsletter_subscription_params
    params.require(:newsletter_subscription).permit(:name, :email, :source)
  end
end
