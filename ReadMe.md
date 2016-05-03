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

#CRUD

*C - Create:*

SQL: CREATE TABLE students2(id serial PRIMARY KEY, name varchar(50));

id | name
----+------
(0 rows)

SQL:INSERT INTO students2 (name)
VALUES ('robin');

INSERT 0 1

*R - Read:*

SQL: SELECT * FROM students2;
 id | name  
----+-------
  1 | robin
(1 row)

*U - Update*

SQL: UPDATE students2 SET name = 'robin2' WHERE name = 'robin';

id |  name  
----+--------
 1 | robin2
(1 row)


*D - Delete*

SQL: DELETE FROM students2 WHERE name = 'robin2';

id | name
----+------
(0 rows)
