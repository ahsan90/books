# Books

## v0.0

D! Document user stories; 
D! Draft the site map and wireframes;
D! Figure out model relationships;
D! Think through controllers/views.

## v0.1

D! Web interface to Book - 6 RESTFUL action - create, new, edit, show, update, destroy
D! Model and web interface to categories - basically do the same for categories
D! Try - set up the association btwn book and category and something on book form to set category (drop down list) 
- rails form helper - populate.
"Method - collections select" - http://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-collection_select
NO. Nesting - topic and post - e.g. view a category to create a new post.


## v0.1.1
D! Refactoring so categories index = book index (categories view - take it out entirely - as tab interface in this - this one page can act - independent page for books show)
D! Create new category in create new book in form - books model change (finder create - ask category table, if not then create a new category).
D! Users - relationship btwn user and books - many to many.
Set up as a stand alone model.  Rails guide:
http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association
Create new table books_users (table) - table has 2 columns, book_id, to user_id (integers) - migration run, 
Book model , has an belongs to many users (and books)
@user.books << @book

D!* Joint table - user and books - 
D!2 pieces of machinery


To do:

[5/02/14 11:51:50 AM] Adam Louis: #1 put some links in the app (probably in the layout) to the devise sign-in/sign-up/sign-out pages
[5/02/14 11:52:05 AM] Adam Louis: #2 create a user#show page, which lists a user's books
[5/02/14 11:52:31 AM] Adam Louis: maybe a users#index, if you think that would be appropriate (probably eventually restrict that to the admisinistrator's permissions)



[5/02/14 11:49:57 AM] Adam Louis: To model a user buying a book, you add that book to the user's list of books
[5/02/14 11:50:17 AM] Adam Louis: Somewhere in a controller soon, there will probably be a line that says like
[5/02/14 11:50:35 AM] Adam Louis: do_credit_card_thing

current_user.books << @book
[5/02/14 11:50:48 AM] Adam Louis: Okay

[5/02/14 11:54:31 AM] Adam Louis: You could do permissions/authorization
[5/02/14 11:54:43 AM] Adam Louis: You could do Stripe to make actual payments

And you could also do carrierwave/fog/s3 to upload actual books


Display of videos
https://github.com/dejan/auto_html



## v0.1

* Create the titles models;
* Test models in console;
* Write RSpec specs for models.

## v0.2

* Create the categories models;
* Associate categories with titles.
* Test models in console;
* Write RSpec specs for models.

## v0.3

* Add Devise;
* Add ability for an Admin to login;
* Add ability for an Admin to create a new book listing.


To be updated with Skype conversation chat.