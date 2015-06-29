describe '#xr_each' do
  it 'should iterate through each element in an Array' do
    expect { %w(a b c d).xr_each { |a| print a } }.to output('abcd').to_stdout
    expect { [1, 2, 3, 4].xr_each { |n| print n } }.to output('1234').to_stdout
  end
  it 'should iterate through each element in a Hash' do
    expect { { a: 'a', b: 'b', c: 'd', d: 'd' }.xr_each { |k, v| print "#{k}: #{v} " } }.to output('a: a b: b c: d d: d ').to_stdout
    expect { { one: 1, two: 2, three: 3, four: 4 }.xr_each { |k, v| print "#{k}: #{v} " } }.to output('one: 1 two: 2 three: 3 four: 4 ').to_stdout
  end
end

describe '#xr_each_with_index' do
  it 'should iterate through each element in an Array' do
    expect { %w(a b c d).xr_each_with_index { |a, i| print "#{i}: #{a} " } }.to output('0: a 1: b 2: c 3: d ').to_stdout
    expect { [1, 2, 3, 4].xr_each_with_index { |n, i| print "#{i}: #{n} " } }.to output('0: 1 1: 2 2: 3 3: 4 ').to_stdout
  end
end

describe '#xr_select' do
  it 'should return an array in which all elements returned true for the given block' do
    expect([1, 2, 3, 4, 5, 6].xr_select(&:even?)).to eq [2, 4, 6]
    expect([1, 2, 3, 4, 5, 6].xr_select(&:odd?)).to eq [1, 3, 5]
    expect([1, 2, 3, 4, 5, 6].xr_select { |n| n > 3 }).to eq [4, 5, 6]
  end
end

describe '#xr_all?' do
  it 'should return true if the block returns true for every element in an Array' do
    expect(%w(a b c d).xr_all? { |a| a.length == 1 }).to eq true
  end
  it 'should return false if the block returns false for any element in an Array' do
    expect(%w(a b c d ee).xr_all? { |a| a.length == 1 }).to eq false
  end
  it 'should return true if the block returns true for every element in a Hash' do
    expect({ a: 'a', b: 'b', c: 'c', d: 'd' }.xr_all? { |_k, v| v.length == 1 }).to eq true
  end
  it 'should return false if the block returns false for any element in a Hash' do
  end
end

describe '#xr_any?' do
  it 'should return true when the block returns true for any element in an Array' do
    expect(%w(a b c d).xr_any? { |a| a.length == 1 }).to eq true
    expect(%w(aa bb c dd).xr_any? { |a| a.length == 1 }).to eq true
  end
  it 'should return false when the block returns false for every element in an Array' do
    expect(%w(a b c d).xr_any? { |a| a.length > 1 }).to eq false
    expect(%w(aa bb c dd).xr_any? { |a| a == 'a' }).to eq false
  end
  it 'should return true when the block returns true for any element in a Hash' do
    expect({ a: 'a', b: 'b', c: 'c', d: 'd' }.xr_any? { |_k, v| v.length == 1 }).to eq true
    expect({ a: 'aa', b: 'bb', c: 'c', d: 'dd' }.xr_any? { |_k, v| v.length == 1 }).to eq true
  end
  it 'should return false when the block returns false for every element in a Hash' do
    expect({ a: 'a', b: 'b', c: 'c', d: 'd' }.xr_any? { |_k, v| v.length > 1 }).to eq false
    expect({ a: 'aa', b: 'bb', c: 'c', d: 'dd' }.xr_any? { |_k, v| v == 'a' }).to eq false
  end
end

describe '#xr_none' do
  it 'should return true when the block returns false for every element in an Array' do
    expect(%w(a b c d).xr_none? { |a| a.length > 1 }).to eq true
    expect(%w(a b c d).xr_none? { |a| a == 'bb' }).to eq true
  end
  it 'should return false when the block returns true for any element in an Array' do
    expect(%w(a bb c d).xr_none? { |a| a.length > 1 }).to eq false
    expect(%w(a bb c d).xr_none? { |a| a == 'bb' }).to eq false
  end
  it 'should return true when the block returns false for every element in a Hash' do
    expect({ a: 'a', b: 'b', c: 'c', d: 'd' }.xr_none? { |_k, v| v.length > 1 }).to eq true
    expect({ a: 'a', b: 'b', c: 'c', d: 'd' }.xr_none? { |_k, v| v == 'bb' }).to eq true
  end
  it 'should return false when the block returns true for any element in a Hash' do
    expect({ a: 'a', b: 'bb', c: 'c', d: 'd' }.xr_none? { |_k, v| v.length > 1 }).to eq false
    expect({ a: 'a', b: 'bb', c: 'c', d: 'd' }.xr_none? { |_k, v| v == 'bb' }).to eq false
  end
end

describe '#xr_count' do
  it 'should return the amount of elemets in an Array for which the block retirns true' do
    expect(%w(a b c a a b a d).xr_count { |a| a == 'a' }).to eq 4
    expect(%w(all a bed cars).xr_count { |a| a.length > 1 }).to eq 3
  end
  it 'should return the amount of elemets in a Hash for which the block retirns true' do
    expect({ a: 'a', b: 'b', c: 'c', d: 'd' }.xr_count { |_k, v| v == 'a' }).to eq 1
    expect({ a: 'a', b: 'bb', c: 'c', d: 'dd' }.xr_count { |_k, v| v.length > 1 }).to eq 2
  end
end

describe '#xr_map' do
  let(:mapper) { Proc.new { |a| a == 'a' } }
  it 'should return a new Array with the results of running the block once for each element ' do
    expect(%w(a b c d).xr_map { |a| a == 'a' }).to eq ['a']
    expect(%w(arch ban clergy do).xr_map { |a| a.length >= 4 }).to eq %w(arch clergy)
    expect(%w(a b c d).xr_map(mapper)).to eq ['a']
  end
end

describe '#xr_inject' do
  it 'should combine all elements in an enum by the operation specified in the block' do
    expect([1, 2, 3, 4].xr_inject(0) { |r, n| r + n }).to eq 10
    expect([1, 2, 3, 4].xr_inject(0) { |r, n| r * n }).to eq 0
    expect({ a: 1, b: 2, c: 3, d: 4 }.xr_inject(0) { |r, n| r + n }).to eq 10
    expect({ a: 1, b: 2, c: 3, d: 4 }.xr_inject(0) { |r, n| r * n }).to eq 0
  end
  context 'when passed no arguments' do
    it 'should default to the first element' do
      expect([1, 2, 3, 4].xr_inject { |r, n| r + n }).to eq 10
      expect([1, 2, 3, 4].xr_inject { |r, n| r * n }).to eq 24
      expect({ a: 1, b: 2, c: 3, d: 4 }.xr_inject { |r, n| r + n }).to eq 10
      expect({ a: 1, b: 2, c: 3, d: 4 }.xr_inject { |r, n| r * n }).to eq 24
    end
  end
end
