require 'rails_helper'

RSpec.describe "static_pages/contact.html.erb", type: :view do
  it "Contains the proper heading" do
    render
    expect(rendered).to include("Contact")
  end
end
