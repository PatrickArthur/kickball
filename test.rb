grades = []
puts "Please enter Grade"
input = gets.chomp
while input != "done"
  grades << input.to_i
  input=gets.chomp
end

total=0
grades.each do |grade|
  total=total+grade
end

avg=total/grades.length
puts avg
if avg > 70
  puts "Passed with average of #{avg}"
else
  puts "failed with average of #{avg}"
end

