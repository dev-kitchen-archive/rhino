class NewsletterSubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :source, :language
end
