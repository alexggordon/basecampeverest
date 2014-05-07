Basecamp Everest
===============

This is a ruby gem for the [Basecamp API](https://github.com/basecamp/bcx-api/). I've tried to make it as complete and true to the API as possible and everything generally follows the same layout as the API. 

A quick note though, hopefully to save some people some frustration, if you see "all" in the method title, then it is not project specific. For example, 

```ruby
Basecampeverest::Project.all 
```

will return all the projects, and 

```ruby
Basecampeverest::TodoList.all 
```

will return ALL the Todo Lists for ALL projects. In the same methodology, any method that includes the word "find" is project specific where it applies. 


INDEX
----------------
* [Installation](https://github.com/alexggordon/Basecampeverest#installation)
* [Initializing the Connection](https://github.com/alexggordon/Basecampeverest#initializing-the-connection)
* [Accesses](https://github.com/alexggordon/Basecampeverest#accesses)
* [Attachments](https://github.com/alexggordon/Basecampeverest#Attachments)
* [Calendars](https://github.com/alexggordon/Basecampeverest#Calendars)
* [Calendar Events](https://github.com/alexggordon/Basecampeverest#calendar-events)
* [Comments](https://github.com/alexggordon/Basecampeverest#comments)
* [Documents](https://github.com/alexggordon/Basecampeverest#documents)
* [Events](https://github.com/alexggordon/Basecampeverest#events)
* [Messages](https://github.com/alexggordon/Basecampeverest#messages)
* [People](https://github.com/alexggordon/Basecampeverest#people)
* [Projects](https://github.com/alexggordon/Basecampeverest#projects)
* [Todo Items](https://github.com/alexggordon/Basecampeverest#todo-items)
* [Todo Lists](https://github.com/alexggordon/Basecampeverest#todo-lists)
* [Topics](https://github.com/alexggordon/Basecampeverest#topics)
* [Uploads](https://github.com/alexggordon/Basecampeverest#uploads)
* [License](https://github.com/alexggordon/Basecampeverest#license)


Installation
----------------
Simply go to your gemfile and add

```ruby
gem 'basecampeverest'
```

And then go to the terminal and run

```ruby
bundle install
```
and you should be all set!

Alternatively, you can run 
```ruby
gem install basecampeverest
```



Initializing the Connection
----------------

The best way to perform the connection is with the ruby :before_filter command 

```ruby
Class whatever < ApplicationController
before_filter :basecamp_connect
...
...
...
private
	def basecamp_connect
		@authorization = { :username => "first.last@example.com", :password => "IuseSecureP@assw0rd$_" }
		@user_agent = "PutAnythingHere (first.last@example.com)"
		@basecamp_ID = "123456"
		Basecampeverest::Connect.new(@basecamp_ID, @authorization, @user_agent)
	end

```

Initializing the controller will return.

```ruby
=> #<Basecampeverest::Connect:0x007abcd123455>
```

Accesses
----------------
This module checks for access to projects. [Access API Reference.](https://github.com/basecamp/bcx-api/blob/master/sections/accesses.md)

There are four methods.

1. __Access for Project__
	```ruby
	Basecampeverest::Access.for_project(project_id)
	```
	Returns a hash with the people that have access to the project. 


2. __Access for Calendar__
	```ruby
	Basecampeverest::Access.for_calendar(calendar_id)
	```
	Returns a hash with the people that have access to a calendar. 


3. __Grant Access to Project__

	The options hash is a hash with the user ID's and email addresses formatted like so:
	```ruby
	{ "ids" => { 5, 6, 10 },
	  "email_addresses" => { "someone@example.com", "someoneelse@example.com" } }
	```

	Pass in this hash to the method. 

	```ruby
	Basecampeverest::Access.grant_project(project_id, options={})
	```
	Returns a 204 if successful. 


4. __Revoke Access to user.__

	Pass in the user ID of the user to revoke access to the project. To obtain the user id take a look in the [people](https://github.com/alexggordon/Basecampeverest#people) section. 

	```ruby
	Basecampeverest::Access.revoke_project(project_id, options={})
	```
	Returns a 204 if successful. 



Attachments
----------------
This module is the first of a two step process for file uploads. [Attachment API Reference](https://github.com/basecamp/bcx-api/blob/master/sections/attachments.md)

It has not been implemented yet. 



Calendars
----------------
This module controls the calendar. [Calendar API Reference](https://github.com/basecamp/bcx-api/blob/master/sections/calendars.md)

There are five methods.

1. __Find all Calendars__

	This method returns all calendars for a project.

	```ruby
	Basecampeverest::Calendar.all
	```
	Returns an array of all the calendars


2. __Find a specific Calendar__

	This method returns a specific calendar.

	```ruby
	Basecampeverest::Calendar.find(calendar_id)
	```
	Returns information about a specific calendar


3. __Create a Calendar__

	This method creates a calendar. The options hash should just contain a :name element. 

	```ruby
	Basecampeverest::Calendar.new(options={})
	```
	Returns a 201 with the information of the created calendar. 


4. __Update a Calendar__

	This method updates a calendar. The options hash should just contain the updated calendar information. 

	```ruby
	Basecampeverest::Calendar.new(options={})
	```
	Returns a 200 with the information of the updated calendar. 


5. __Delete a Calendar__

	This method deletes a calendar. 

	```ruby
	Basecampeverest::Calendar.delete(calendar_id)
	```
	Returns a message with the success or failure of the deletion. 


Calendar Events
----------------
This module controls the calendar events. A quick note, this is not to be confused with events, which is different. Yes they could have been better named, but they weren't. [Calendar Events API Reference](https://github.com/basecamp/bcx-api/blob/master/sections/calendar_events.md)

There are eleven methods.


1. __Upcoming events for the Project__

	This method

	```ruby
	Basecampeverest::
	```
	Returns a 


2. __Upcoming events for the Project__

	This method

	```ruby
	Basecampeverest::
	```
	Returns a 

3. __Upcoming events for the Project__

	This method

	```ruby
	Basecampeverest::
	```
	Returns a 


4. __Upcoming events for the Project__

	This method

	```ruby
	Basecampeverest::
	```
	Returns a 


5. __Upcoming events for the Project__

	This method

	```ruby
	Basecampeverest::
	```
	Returns a 

6. __Upcoming events for the Project__

	This method

	```ruby
	Basecampeverest::
	```
	Returns a 


7. __Upcoming events for the Project__

	This method

	```ruby
	Basecampeverest::
	```
	Returns a 


8. __Upcoming events for the Project__

	This method

	```ruby
	Basecampeverest::
	```
	Returns a 

9. __Upcoming events for the Project__

	This method

	```ruby
	Basecampeverest::
	```
	Returns a 


10. __Upcoming events for the Project__

	This method

	```ruby
	Basecampeverest::
	```
	Returns a 


11. __Upcoming events for the Project__

	This method

	```ruby
	Basecampeverest::
	```
	Returns a 


Comments
----------------

Documents
----------------

Events
----------------

Messages
----------------

People
----------------

Projects
----------------

Basecampeverest::Project.all

```ruby
=>[{"id"=>494832908, "name"=>"Cool Basecamp Project", "description"=>"this is a description", "archived"=>false, "is_client_project"=>false, 
"created_at"=>"2013-11-06T13:53:17.000-05:00", "updated_at"=>"2013-12-05T13:34:20.000-05:00", "draft"=>false,
"last_event_at"=>"2013-12-05T13:34:20.000-05:00", "starred"=>false,
"url"=>"https://basecamp.com/123456/api/v1/projects/494832908-Cool-Basecamp-Project.json"}]
```


Todo Items
----------------

Todo Lists
----------------

Topics
----------------

Uploads
----------------

License
----------------
The MIT License (MIT)

Copyright (c) 2014 Veracross LLC, Alex Gordon

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
