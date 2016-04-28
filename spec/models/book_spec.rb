require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to validate_presence_of(:title_de) }
  it { is_expected.to validate_presence_of(:title_en) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:description_de) }
  it { is_expected.to validate_presence_of(:description_en) }
  it { is_expected.to validate_presence_of(:image) }

  it { is_expected.to have_many(:chapters) }
end
