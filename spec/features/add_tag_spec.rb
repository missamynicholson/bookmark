feature "tagging links" do
  scenario "add a tag to a link" do
    create_link_with_tag("search engine")
    expect(current_path).to eq "/links"
    link = Link.first
    expect(link.tags.map(&:tag_name)).to include("search engine")
  end
end
