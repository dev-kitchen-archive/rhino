require 'rails_helper'

RSpec.describe Medium, type: :model do
  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to validate_presence_of(:title_de) }
  it { is_expected.to validate_presence_of(:title_en) }
  it { is_expected.to validate_presence_of(:teaser_de) }
  it { is_expected.to validate_presence_of(:teaser_en) }
  it { is_expected.to validate_presence_of(:thumbnail) }
  it { is_expected.to validate_presence_of(:chapter) }
end
