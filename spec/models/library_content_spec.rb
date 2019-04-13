require 'rails_helper'

RSpec.describe LibraryContent, type: :model do
  it { should validate_presence_of(:library_id) }
  it { should validate_presence_of(:content_id) }
  it { should belong_to(:library) }
  it { should belong_to(:content) }
end
