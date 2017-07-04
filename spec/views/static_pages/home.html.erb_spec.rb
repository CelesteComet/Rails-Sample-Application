require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", type: :view do
  it "Contains the proper heading" do
    render
    expect(rendered).to include("This is the home page")
  end
end
