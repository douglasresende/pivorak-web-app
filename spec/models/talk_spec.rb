# frozen_string_literal: true

RSpec.describe Talk do
  describe 'relations' do
    it { is_expected.to belong_to(:event) }
    it { is_expected.to belong_to(:speaker) }
    it { is_expected.to belong_to(:group) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  it 'applies a scope to talk collections by created_date' do
    expect(described_class.all.sorted_by_date.to_sql).to eq described_class.all.order(created_at: :desc).to_sql
  end
end
