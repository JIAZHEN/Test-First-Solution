def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(nums)
  nums.reduce(0) { |sum, n| sum + n }
end

def multiply(nums)
  nums.reduce(1) { |sum, n| sum * n }
end

def power(a, b)
  a ** b
end

def factorial(n)
  return 0 if n == 0
  (1..n).to_a.reduce(1) { |sum, n| sum * n }
end