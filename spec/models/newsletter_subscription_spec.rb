require 'rails_helper'

RSpec.describe NewsletterSubscription, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:source) }
  it { is_expected.to validate_presence_of(:language) }

  it { is_expected.to allow_value('t@e.o').for(:email) }
  it { is_expected.to allow_value('1@1.1').for(:email) }
  it { is_expected.to_not allow_value('t').for(:email) }
  it { is_expected.to_not allow_value('t@t').for(:email) }

  it { is_expected.to validate_inclusion_of(:source).in_array(%w(ios android)) }
  it { is_expected.to validate_inclusion_of(:language).in_array(I18n.available_locales.map(&:to_s)) }
end
