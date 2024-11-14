def count_fair_pairs(nums, lower, upper)
  nums.sort!
  n = nums.size
  count = 0

  # For each element, use binary search to find valid pairs
  (0...n).each do |i|
    left = lower_bound(nums, i + 1, lower - nums[i])
    right = upper_bound(nums, i + 1, upper - nums[i])
    count += right - left
  end

  count
end

def lower_bound(nums, start, target)
  left, right = start, nums.size
  while left < right
    mid = (left + right) / 2
    if nums[mid] < target
      left = mid + 1
    else
      right = mid
    end
  end
  left
end

def upper_bound(nums, start, target)
  left, right = start, nums.size
  while left < right
    mid = (left + right) / 2
    if nums[mid] <= target
      left = mid + 1
    else
      right = mid
    end
  end
  left
end
