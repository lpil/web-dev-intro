So far we have learnt how to make a tiny web application with Sinatra, and
learn how to create routes for different requests to our application, such as
ones to `/` or `/about`. Let's now look as how we can go about serving web
pages.

In order to continue we'll need to know enough HTML to make a simple web page,
and understand what the more common HTML elements do. `<head>`, `<body>`,
`<div>`, `<p>`. That sort of thing.

If you feel you'd like to know more HTML, check out these useful resources:

* **TODO: INSERT LINK HERE**.


## The problem with strings

In our routes we're returning strings which are then being sent to the user's
browser. Here we're sending the string `'Hello!'` from the `'/'` route.

```ruby
require 'sinatra'

get '/' do
  'Hello!'
end
```

Now what if we wanted to send a HTML page to the user? Well I guess we'd need
to write it inside that string.

```ruby
require 'sinatra'

get '/' do
  '<!DOCTYPE html><html><head><title>Hi!</title></head><body><h1>Hi!</h1></body></html>'
end
```

Gosh, that's a long line. It's really hard to read, and we've not even started
to put any content on the page. Returning a string like this is clearly not
the optimal way to do this, we're going to need to try something new.


## Templates
