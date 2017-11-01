Given(/^I am in the Moviest App$/) do
  wait_for_element_exists("* id:'imageview'")
end

Given(/^I touch on Search field$/) do
  search = "* id:'action_search'"
  wait_for_element_exists(search)
  touch(search)
end

When(/^I look for a movie with the partially complete name$/) do
  keyboard_enter_text('the lord')
  hide_soft_keyboard
end

Then(/^I hope to see the "([^"]*)" related to the search term$/) do |mov|
  wait_for_text(mov)
end

When(/^I search for a "([^"]*)"$/) do |mov|
  keyboard_enter_text(mov)
  hide_soft_keyboard
end

Then(/^I hope to see the "([^"]*)" of the movie$/) do |assert|
  wait_for_element_exists("* id:'#{assert}'")
end

Then(/^I hope to see the Sinopse of the movie$/) do
  wait_for_text('Suave, charming')
end

When(/^I leave the search field empty$/) do
  hide_soft_keyboard
end

Then(/^I do not expect to see any search results$/) do
  wait_for_element_does_not_exist("* id:'imageview'")
end

When(/^I Scroll down the movie list$/) do
  scroll = 1
  while scroll < 20 do
    pan_up
    scroll = scroll + 1
  end
end

Then(/^I hope the scroll continues non\-stop$/) do
  wait_for_element_does_not_exist("* id:'progress_bar'")
end

Then(/^I hope to see the movie in the top one search$/) do
  wait_for_element_exists("* id:'imageview'")
  wait_for_element_exists("* id:'text_title'")
  if query("* id:'text_title'").first['text'] != '2 Fast 2 Furious'
    raise "Movie not found on top of the search"
  end
end
