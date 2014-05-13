#prompt for amount due
puts 'What is the amount due?'
due = gets.chomp.to_f

#prompt for amount tendered
puts 'What is the amount tendered?'
tendered = gets.chomp.to_f

#determine if tender is greater than or erqual to due
if tendered >= due
  change = (tendered-due)
  time=Time.new.strftime "%m/%d/%Y %H:%M%p"
  puts "===Thank You!==="
  puts "The total change due is $#{'%.2f' % change}."
  puts ""
  puts "#{time}"
  puts "================"

else
  changen = (due-tendered)
  puts "WARNING: Customer still owes $#{'%.2f' % changen}! Exiting..."
end
