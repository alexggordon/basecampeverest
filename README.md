Basecamp Everest
===============

This is a ruby gem for the [Basecamp API](https://github.com/basecamp/bcx-api/). I've tried to make it as complete and true to the API as possible and everything generally follows the same layout as the API. 

A quick note though, hopefully to save some people some frustration, if you see "all" in the method title, then it is not project specific. For example, 

```
Basecampeverest::Project.all 
```

will return all the projects, and 

```
Basecampeverest::TodoList.all 
```

will return ALL the Todo Lists for ALL projects. In the same methodolgy, any method that includes the word "find" is project specific where it applies. 


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

```
gem 'basecampeverest'
```

And then go to the terminal and run

```
bundle install
```
and you should be all set!


Initializing the Connection
----------------

The best way to perform the connection is with the ruby :before_filter command 

```
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

```
=> #<Basecampeverest::Connect:0x007abcd123455>
```

Accesses
----------------

Attachments
----------------

Calendars
----------------

Calendar
----------------

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

```
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

Copyright (c) 2014 Alex Gordon

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
