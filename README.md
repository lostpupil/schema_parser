# SchemaParser

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'schema_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install schema_parser

## Requirements

You should have [Graphviz](http://www.graphviz.org/) installed on your machine.

## Example

Consider you have a file called `example.schema.txt`

```txt
Club
==================================================
id                                         int(11)
name                                  varchar(255)
address                               varchar(255)
expired_at                                datetime
created_at                                datetime
updated_at                                datetime
ecard                                      int(11)
image_keys                            varchar(255)
portable                                tinyint(1)
--------------------------------------------------

School
==================================================
id                                         int(11)
name                                  varchar(255)
address                               varchar(255)
ecard                                      int(11)
expired_at                                datetime
created_at                                datetime
updated_at                                datetime
portable                                tinyint(1)
--------------------------------------------------

Game
==================================================
id                                         int(11)
start_at                                  datetime
end_at                                    datetime
lat                                         double
lng                                         double
address                               varchar(255)
created_at                                datetime
updated_at                                datetime
name                                  varchar(255)
image_key                             varchar(255)
image_keys                            varchar(255)
--------------------------------------------------

ClubGame
==================================================
game_id                                    int(11)
club_id                                    int(11)
--------------------------------------------------

SchoolGame
==================================================
game_id                                    int(11)
school_id                                  int(11)
--------------------------------------------------

ClubProfile
==================================================
id                                         int(11)
user_id                                    int(11)
club_id                                    int(11)
avatar_key                            varchar(255)
course_id                                  int(11)
gender                                     int(11)
birthday                                  datetime
point                                      int(11)
ce                                         int(11)
created_at                                datetime
updated_at                                datetime
realname                              varchar(255)
--------------------------------------------------

SchoolProfile
==================================================
id                                         int(11)
user_id                                    int(11)
avatar_key                            varchar(255)
classroom_id                               int(11)
gender                                     int(11)
birthday                                  datetime
point                                      int(11)
ce                                         int(11)
created_at                                datetime
updated_at                                datetime
realname                              varchar(255)
school_id                                  int(11)
--------------------------------------------------
```

Then you can write a ruby file like below

```ruby
sp = SchemaParser::Parser.new('./example.schema.txt', 'example.dot')
sp.draw
```

You will get a dot file and a png file.

![example.dot.png](https://github.com/KTFootball/schema_simple_er_map/blob/master/example.dot.png "example.dot.png")

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/schema_parser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

