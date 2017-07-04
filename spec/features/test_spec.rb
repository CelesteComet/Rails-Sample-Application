describe "Clicking links", :type => :feature do
  it "redirects to proper pages" do
    visit '/'
    expect(page).to have_content 'Home'
    find_link('About').click
    expect(page).to have_content 'This is the sample application for the'
    find_link('Contact').click
    expect(page).to have_content 'at the contact page'
  end
end

