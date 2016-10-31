require 'spec_helper'
require 'card'

RSpec.describe Card do
  describe '#valid?' do
    it 'passes for valid cards' do
      expect(Card.new('AH')).to be_valid
    end

    it "failes for invalid cards" do
      expect(Card.new('FISH')).not_to be_valid
    end
  end

  describe '#value' do
    it 'correctly parses tens values' do
      expect(Card.new('TH').value).to eq('T')
    end
  end
end
