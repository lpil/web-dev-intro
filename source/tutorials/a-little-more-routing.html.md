Hi again! So far we have learnt how to make a tiny web application with
Sinatra, and learn how to create routes for different requests to our
application, such as ones to `/` or `/about`.

## Hello, world!

Let's add to our application so that it can greet visitors by name when they
visit paths like `/hello/:name`, such as `/hello/sarah`.

```ruby
get '/hello/sarah' do
  'Hello Sarah!'
end
```

Stop your application (`ctrl+c` in the terminal, remember?), and start it
again
(`ruby app.rb`) so that the code changes are picked up. Now try visiting
`http://localhost:4567`.

That was easy. Let's add another name.

```ruby
get '/hello/sarah' do
  'Hello Sarah!'
end

get '/hello/niamh' do
  'Hello Niamh!'
end
```

And if we restart the app again this one works too. Time for a few more.

```ruby
get '/hello/sarah' do
  'Hello Sarah!'
end

get '/hello/niamh' do
  'Hello Niamh!'
end

get '/hello/morgan' do
  'Hello Morgan!'
end

get '/hello/bilal' do
  'Hello Bilal!'
end

get '/hello/sarah-jane' do
  'Hello Sarah-Jane!'
end

get '/hello/dave' do
  'Hello Dave!'
end
```

OK, this is starting to become less than ideal. We're repeating outselves a
lot typing nearly the same thing over and over, and we're going to have to
define a route for every name we want to be able to greet. What's a better
solution?


## Named route parameters

If we look at the pattern in each of the routes above (the `'/hello/sarah'`
string is called a pattern, by the way) it's clear that they all have a fixed
structure of `/hello/:name`, where the `:name` part is the name of the person
we want to greet.

It turns out we can write one route that matches all of these paths like this:

```ruby
get '/hello/:name' do
  'Hello ???'
end
```

Restart your app and try it out. If it didn't work double check that you have
the `:` before `name` in the pattern, as this is how we let Sinatra know that
this part of the pattern is variable, and can be any word at all.

Great, now we can match any `/hello/whatever` request. We still need to reply
with the correct name though.

When we make a section of the pattern varible like this, we're actually
turning it into what's called a 'named parameter'. The part of request URL
that matches the variable section is places into a hash for us to access
within the route.

```ruby
get '/hello/:name' do
  name = params[:name]  # Get the name from the parameters hash
  "Hello #{name}"       # Interpolate the name into the string
end
```
