require 'rails_helper'

RSpec.describe "static_pages/about.html.erb", type: :view do
  it "Contains the proper heading" do
    render
    expect(rendered).to include("About Us")
  end
end
