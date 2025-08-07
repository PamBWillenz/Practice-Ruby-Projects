require './caeser_cipher'

RSpec.describe 'Caeser Cipher' do
  describe '#caeser_cipher' do
    it 'shifts letters by the specified amount' do
      expect(caeser_cipher('What a string!', 5)).to eq('Bmfy f xywnsl!')
    end

    it 'wraps around the alphabet' do
      expect(caeser_cipher('Zebra', 3)).to eq('Cheud')
    end

    it 'does not shift non-alphabetic characters' do
      expect(caeser_cipher('Hello, World!', 2)).to eq('Jgnnq, Yqtnf!')
    end

    it 'handles negative shifts' do
      expect(caeser_cipher('Hello, World!', -2)).to eq('Fcjjm, Umpjb!')
    end
  end
end