require 'rails_helper'

RSpec.describe "static_pages/help.html.erb", type: :view do
  it "Contains the proper heading" do
    render
    expect(rendered).to include("Help")
  end
end
