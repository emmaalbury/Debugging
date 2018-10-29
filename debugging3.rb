def factorial(n)
  product = 1
  p "at the start product is #{product}"
  while n > 0
    p "we multiply #{product} by #{n}"
    product *= n
    p "we get #{product}"
    p "we minus 1 from #{n}"
    n -= 1
  end
  product
end

puts factorial(5)

# ORIGINAL:
# def factorial(n)
#   product = 1
#   while n > 0
#     n -= 1
#     product *= n
#   end
#   product
# end
#
# # Intended output:
# #
# # > factorial(5)
# # => 120
