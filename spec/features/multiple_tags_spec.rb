feature "multiple tags" do
  scenario "user can add multiple tags to one link" do
    create_link_with_tag("search engine, bubbles")
    link = Link.first
    expect(link.tags.map(&:tag_name)).to include("search engine", "bubbles")
    expect(page).to have_content "Title:Google URL:www.google.com Tags:search engine, bubbles"
  end
end
