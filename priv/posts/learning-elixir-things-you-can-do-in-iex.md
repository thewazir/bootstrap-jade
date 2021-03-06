---
title: Learning Elixir - things you can do in IEx
layout: post
tags: ['coding']
intro: "For the Tucson Elixir meetup I gave a lightning talk on IEx, explaining some things that a new Elixir developer might not know. "
date: 2017-04-05
---

If you don’t know what IEx is it’s the interactive elixir shell which is included when Elixir is installed on your computer. Since this post is based on a lightning talk I won’t cover every single feature but I will mention a few things that I think are good to know.

## A few of the things IEx can do for you

* <a href="https://hexdocs.pm/iex/IEx.Helpers.html">IEx Helpers</a> which are AMAZING!
* Autocomplete with . (dot) lookup
* Help break incomplete expressions
* Shell Configuration
* Pry into code

All of the features in IEx are detailed <a href="https://hexdocs.pm/iex/IEx.html">here</a></p>

## Start IEx
Open your terminal and launch iex by simply typing `iex` and then enter. This
interactive mode evaluates any Elixir expression which makes it an excellent place to get comfortable with Elixir &amp; OTP.

```
$ iex
Erlang/OTP 19 [erts-8.2] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.4.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> person = %{name: "Remo Williams"}
%{name: "Remo Williams"}
iex(2)>
```


## IEx.helpers
One of the most useful helpers is the `h/1` function available from the <a href="https://hexdocs.pm/iex/IEx.Helpers.html#content">IEx.Helpers</a> module. To see everything that `IEx.Helpers` provides run `h()` inside IEx. To learn about IEx run `h(IEx)`.

Some examples:
* <code>clear/0</code> - clear the screen
* <code>h/1</code> - get module docs
* <code>i/1</code> - print stuff about a type
* <code>respawn/0</code> - respawn shell
* <code>s/1</code> - print specs for a module or function
* ... 24 total helpers available

`respawn()` is another function which I use a lot to start a new shell process.
Take the time to become familiar with the helpers available from `IEx.Helpers`.

## Autocomplete
If you don't know what functions are available in a module, type the module name with a dot on the end and press tab to see a list of available functions.
I have an example of using the autocomplete feature with the `Map` module, type `Map.` and make sure there is a dot after `Map`, then press tab and you should see a list of functions/arity pairs. Pretty neat!

```
iex(1)> Map.
delete/2             drop/2               equal?/2
fetch!/2             fetch/2              from_struct/1
get/2                get/3                get_and_update!/3
get_and_update/3     get_lazy/3           has_key?/2
keys/1               merge/2              merge/3
new/0                new/1                new/2
pop/2                pop/3                pop_lazy/3
put/3                put_new/3            put_new_lazy/3
split/2              take/2               to_list/1
update!/3            update/4             values/1
```

## #iex:break
This is one of the best features.

In the example below a Map is not closed properly, leaving the expression open and creating chaos. Typing `#iex:break` will essentially break the expression and allow you to continue as if nothing happened. You will still need to type the expression in again and close it properly. This is probably my favorite feature and something I didn’t know until I started preparing for my talk.

```
iex(2)> %{user: "Artoo",
...(2)> name: "R2D2',
...(2)> type: 'robot'}
...(2)> .
...(2)> ;
...(2)> end
...(2)> %}
...(2)> #iex:break
** (TokenMissingError) iex:2: incomplete expression
```

## Shell Configuration

Personally I have not configured my IEx shell and have left the default settings. It’s good to know what is configurable in case changes need to be made.

This is a list of what you can change as of Elixir 1.4:

* :colors
* :inspect
* :width
* :history_size
* :default_prompt
* :alive_prompt

### :inspect

Inspect options used by the shell when printing results of expression evaluation. If you want to see everything during `IO.inspect/1` then do this:
```
IEx.configure [inspect: [limit: :infinity]]
```
See more here <a href="https://hexdocs.pm/elixir/Inspect.Opts.html">Inspect.Opts</a>.

### Note: different kinds of inspects
<code>inspect/1</code> and <code>i/1</code> are different.

```
iex(2)> foo = %{ name: "Bruce Wayne", location: "Gotham"}
%{location: "Gotham", name: "Bruce Wayne"}
iex(3)> inspect(foo)
"%{location: \"Gotham\", name: \"Bruce Wayne\"}"
iex(4)> i(foo)
Term
  %{location: "Gotham", name: "Bruce Wayne"}
Data type
  Map
Reference modules
  Map
Implemented protocols
  IEx.Info, Collectable, Enumerable, Inspect
```

## Pry into code
Debugging is entirely worthy of its own discussion but `IEx.pry` should be briefly mentioned here. You will need to require `IEx` in a module before you can use `pry/0`. Notice in the example below that `require IEx` and `IEx.pry` are both used together. `pry/0` was new to me since I did not have a background in Ruby, it’s a lot like `debugger;` from JavaScript except when using `pry` “<span style="font-style:italic">Setting variables or importing modules in IEx does not affect the caller the environment</span>” (from the <a href="https://hexdocs.pm/iex/IEx.html#pry/1">pry docs</a>).

```
defmodule say do
 require IEx

 do something() do
  IEx.pry

  IO.puts("Hello, World")
 end
end
```

I hope you have learned a little bit more about what IEx offers to you, and you now know where to find out more. Things change with new releases so check with the latest documentation to know how a feature works. &#128512;

