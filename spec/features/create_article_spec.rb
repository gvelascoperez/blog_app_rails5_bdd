require "rails_helper"

RSpec.feature "Creating Articles" do
	scenario "A user creates an article" do
		visit "/"
		click_link "New Article"

		fill_in "Title", with: "New Article"
		fill_in "Body", with: "Lorem ipsum lorum"

		click_button "Create Article"

		expect(page).to have_content("A new article has been created")
		expect(page.current_path).to eq(articles_path)
	end	
end