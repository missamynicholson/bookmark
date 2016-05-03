#User Stories


As a User
So I can view the bookmarks I have stored
I want to be shown a list of links ordered descending chronologically as a default

As a User
So I can add new links to my bookmarks
I want a way to save a new link

As a User
So that I can easily find a link
I want to be able to add a tag to a bookmark group with other similar links

As a User
So I can find all links grouped by a particular tag
I want to be able to enter a tag and see the corresponding links

#Domain Model

Nouns -Bookmark, links, tag
Verbs - Store, view, tag, find

Bookmark <= store(links, tag)
Bookmark <= view
Bookmark <= find(tag)
