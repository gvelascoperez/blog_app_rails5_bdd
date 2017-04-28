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

	scenario "A user fails to create a new article" do
		visit "/"
		click_link "New Article"

		fill_in "Title", with: ""
		fill_in "Body", with: ""

		click_button "Create Article"

		expect(page).to have_content("Article has not been created")
		expect(page).to have_content("Title can't be blank")
		expect(page).to have_content("Body can't be blank")
	end
end