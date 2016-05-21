class NewsletterSubscription < ActiveRecord::Base
  SOURCES = %w(ios android).freeze

  validates :name, presence: true
  validates :email, presence: true, format: /\A.+@.+\..+\z/
  validates :source, presence: true, inclusion: SOURCES
  validates :language, presence: true, inclusion: I18n.available_locales.map(&:to_s)
end
