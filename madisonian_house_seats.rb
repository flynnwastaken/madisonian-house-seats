def prompt
  print ">> "
end

def end_query
  puts "Do you want to run again? (Y)/(N)"
  prompt
  reply = $stdin.gets.chomp

  if reply.downcase == "y"
    madisonian
  elsif reply.downcase == "n"
    exit(0)
  else
    puts "I'm sorry, I don't understand"
    end_query
  end
end

def madisonian
  puts "What is the population of your state?"
  prompt
  population = $stdin.gets.chomp.to_f

  limit = 100

  denominator = 20_000 + 100 * limit

  reps = (population / denominator).ceil

  while limit < reps
    limit += 100
    denominator = 20_000 + 100 * limit
    reps = (population / denominator).ceil

    if reps < limit - 100
      reps = limit - 100
      denominator = (population / reps).ceil
    end
  end

  puts "Your state should have 1 representative per #{denominator} population,",
    "and should have #{reps} representatives total. If you want to use",
    "single-transferable vote with multi-member districts, you should probably",
    "have #{(reps / 5.0).ceil} districts."

  end_query
end

madisonian
