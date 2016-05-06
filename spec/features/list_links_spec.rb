feature "view all bookmarked links" do
	scenario "show list of all bookmarked links" do
		link = Link.create(title: "Google", url: "www.google.com")
		visit "/links"
		expect(page.status_code).to eq 200
		expect(page).to have_content("www.google.com")
	end
end
