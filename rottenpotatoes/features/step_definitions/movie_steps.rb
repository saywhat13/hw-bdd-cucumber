# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  page.body.should =~ /#{e1}.*#{e2}/m
end

Then /I should see (all|none) of the movies/ do |selection|
  total_movies = page.all("tbody#movielist tr").count
  puts "Total movies are #{total_movies}"
  if selection == "all"
    total_movies.should == 10
  elsif selection == "none"
    total_movies.should == 0
  end
end

