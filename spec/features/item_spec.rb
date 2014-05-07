require_relative '../spec_helper'

feature 'create and index page' do
  scenario 'user can create an item' do
    visit '/'
    click_on 'Create Item'
    fill_in 'Item Name', with: "My Item"
    click_on 'Create Item'

    expect(page).to have_content("My Item")
  end
end

feature 'read/show page' do
  scenario 'user can view an item page' do
    visit '/'
    click_on 'Create Item'
    fill_in 'Item Name', with: "My Item"
    click_on 'Create Item'
    click_on 'My Item'

    expect(page).to have_content("My Item")
  end
end

feature 'read/show page with updated item' do
  scenario 'user can update an item' do
    visit '/'
    click_on 'Create Item'
    fill_in 'Item Name', with: "My Item"
    click_on 'Create Item'
    click_on 'My Item'
    click_on 'Update Item'
    fill_in 'Item Name', with: "My Updated Item"
    click_on 'Update Item'

    expect(page).to have_content("My Updated Item")
  end
end

feature 'index page without deleted item' do
  scenario 'user can delete an item' do
    visit '/'
    click_on 'Create Item'
    fill_in 'Item Name', with: "My Item"
    click_on 'Create Item'
    expect(page).to have_content("My Item")
    click_on 'My Item'
    click_on 'Delete Item'

    expect(page).to_not have_content("My Item")
  end
end

