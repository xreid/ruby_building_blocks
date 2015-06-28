describe '#caesar_cipher' do
  it 'returns d' do
    expect(caesar_cipher('a', 3)).to eq 'd'
  end
  it 'returns x' do
    expect(caesar_cipher('a', -3)).to eq 'x'
  end
  it 'returns y' do
    expect(caesar_cipher('e', -6)).to eq 'y'
  end
  it 'returns c' do
    expect(caesar_cipher('z', 3)).to eq 'c'
  end
  it 'returns D' do
    expect(caesar_cipher('A', 3)).to eq 'D'
  end
  it 'returns Ndssd Chwd Fkl.' do
    expect(caesar_cipher('Kappa Zeta Chi.', 3)).to eq('Ndssd Chwd Fkl.')
  end
  it "returns Please enter a valid String (e.g. 'Sample text.') and Fixnum (e.g. 5)." do
    expect(caesar_cipher(0, 3)).to eq("Please enter a valid String (e.g. 'Sample text.') and Fixnum (e.g. 5).")
  end
end

describe '#stock_picker' do
  it 'returns the best day to buy and the best day to sell' do
    expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq [1, 4]
  end
  context 'when the lowest day is the last' do
    it 'returns the best day to buy and the best day to sell' do
      expect(stock_picker([7, 13, 4, 8, 5, 8, 6, 11, 1])).to eq [2, 7]
    end
  end
  context 'when the highest day is the first' do
    it 'returns the best day to buy and the best day to sell' do
      expect(stock_picker([21, 13, 4, 8, 5, 8, 6, 11, 1])).to eq [2, 7]
    end
  end
  context 'when the prices are all the same' do
    it "returns 'The prices are the same each day!'" do
      expect(stock_picker([4, 4, 4, 4])).to eq 'The prices are the same each day!'
    end
  end
  context 'with erroneous input' do
    it "returns 'Please enter a valid array of prices (e.g. [1, 4, 2, 27]).'" do
      expect(stock_picker('ayy lmao')).to eq 'Please enter a valid array of prices (e.g. [1, 4, 2, 27]).'
    end
    it "returns 'Please enter a valid array of prices (e.g. [1, 4, 2, 27]).'" do
      expect(stock_picker(['ayy lmao'])).to eq 'Please enter a valid array of prices (e.g. [1, 4, 2, 27]).'
    end
  end
  context 'when profit is not possible' do
    it "returns 'Sorry. There's no profit to be had here.'" do
      expect(stock_picker([4, 3, 2, 1])).to eq "Sorry. There's no profit to be had here."
    end
  end
end

describe '#substrings' do
  let(:dictionary) { %w(below down go going horn how howdy it i low own part partner sit) }
  context "when given 'below'," do
    it 'returns below: 1 low: 1' do
      expect(substrings('below', dictionary)).to include('below' => 1, 'low' => 1)
    end
  end
  context "when given 'Howdy partner, sit down! How's it going?'," do
    it 'returns down: 1, how: 2, howdy: 1, go: 1, going: 1, it: 2, i:  3, own: 1,part: 1, partner: 1, sit: 1' do
      expect(substrings("Howdy partner, sit down! How's it going?", dictionary)).to include('down' => 1, 'how' => 2, 'howdy' => 1, 'go' => 1, 'going' => 1, 'it' => 2, 'i' => 3, 'own' => 1, 'part' => 1, 'partner' => 1, 'sit' => 1)
    end
  end
end

describe '#bubble_sort' do
  it 'sorts an unsorted array of Integers' do
    expect(bubble_sort([1, 3, 6, 2, 4, 3])).to eq [1, 2, 3, 3, 4, 6]
    expect(bubble_sort([4, 3, 78, 2, 0, 2])).to eq [0, 2, 2, 3, 4, 78]
    expect(bubble_sort([4, 4, 78, 4, 4, 0])).to eq [0, 4, 4, 4, 4, 78]
  end
  it 'sorts an unsorted array strings' do
    expect(bubble_sort(%w(a d a c r h))).to eq %w(a a c d h r)
  end
  it 'only accepts arrays' do
    expect(bubble_sort('Hi Johnny')).to eq 'Please enter an array.'
  end
  context "when given a block" do
    it 'sorts an array of strings by specifications of the block' do
      expect(bubble_sort(%w(hi hello hey)) { |left, right| left.length - right.length }).to eq %w(hi hey hello)
    end
  end
end
