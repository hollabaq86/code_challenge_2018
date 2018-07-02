# code_challenge_2018

This picks out randomized groups based on a list of entries and the number of entries per group.

It requires a CSV file containing entries, they can be multiple colums, however entries are comma separated.

```
#example test.csv
entry
john
jane
jack

#or test.csv
entry1,entry2
john,john
jack,jack
jane
```

It will return a CSV file titled `results.csv`, where each row is a group of randomized, deduped entries and each column is an entry.

```
#example results.csv
entry_1,entry_2
john,jack
jane
```

## dependencies

This repo runs in Ruby, version 2.3.0. All dependencies are located in the Gemfile. In the command line, run:

```$ bundle install```

## testing

Unit Tests for determining groups (`picker.rb`) are written using RSpec. To run all tests:

```$ bundle exec rspec```

To test the user interface, create a test CSV file:

```$ ruby gen_test_file.rb ```

_To optionally check for dedupe logic:_

```$ ruby gen_test_file.rb dup```


Then run `app.rb` in your terminal:

```
$ ruby app.rb

filename containing names to group?
#enter name of source file

how many entries per group?
#enter number of entries
```

## how to use

Run `app.rb` in terminal:

```
$ ruby app.rb

filename containing names to group?
#enter name of source CSV file

how many entries per group?
#enter number of entries
```

The app will print results to the screen and ask if you would like to regenerate those results (y/n).

