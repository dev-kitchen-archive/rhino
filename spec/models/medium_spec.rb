require 'rails_helper'

RSpec.describe Medium, type: :model do
  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:teaser) }
  it { is_expected.to validate_presence_of(:thumbnail) }
  it { is_expected.to validate_presence_of(:chapter) }
end
