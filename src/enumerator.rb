#TODO document Enumerator
module Enumerable
  def xr_each
    if self.is_a?(Hash)
      for key in keys
        yield(key, self[key])
      end
    else
      for i in 0...size
        yield self[i]
      end
    end
  end

  def xr_each_with_index
    for i in 0...size
      yield(self[i], i)
    end
  end

  def xr_select
    result = []
    xr_each do |member|
      result << member if yield member
    end
    result
  end

  def xr_all?
    if self.is_a?(Hash)
      xr_each { |key, value| return false unless yield(key, value) }
    else
      xr_each { |member| return false unless yield member }
    end
    true
  end

  def xr_any?
    if self.is_a?(Hash)
      xr_each { |key, value|return true if yield(key, value)}
    else
      xr_each { |member| return true if yield member }
    end
    false
  end

  def xr_none?
    if self.is_a?(Hash)
      xr_each { |key, value| return false if yield(key, value) }
    else
      xr_each { |member| return false if yield member }
    end
    true
  end

  def xr_count
    count = 0
    if self.is_a?(Hash)
      xr_each { |key, value| count += 1 if yield(key, value) }
    else
      xr_each { |member| count += 1 if yield member }
    end
    count
  end

  def xr_map(mapper = nil)
    result = []
    xr_each do |member|
      if !mapper.nil?
        result << member if mapper.call(member)
      else
        result << member if yield member
      end
    end
    result
  end

  def xr_inject(carry_value = nil)
    hash = true if self.is_a? Hash
    carry_value = hash ? shift[1] : shift if carry_value.nil?
    if hash
      xr_each { |_key, value| carry_value = yield(carry_value, value) }
    else
      xr_each { |member| carry_value = yield(carry_value, member) }
    end
    carry_value
  end
end
