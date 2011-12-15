# Martin

A Ruby/Sinatra web application boilerplate optimized for immediate deployment to your favorite cloud server.

## Quick Install

Martin prefers [Bundler](http://gembundler.com/) for dependency management and recommends [Thin](http://code.macournoyer.com/thin/) as a web server.

```
$ bundle install
$ bundle exec rake db:bootstrap
$ bundle exec thin start
```

You should have a test server running at ```http://localhost:3000```.

Martin suggests immediately replacing everything in ```views/index.erb```, ```public/js/global.js```, and ```public/css/screen.css```.

## Quick Deploy

Once you've got things working to your satisfaction, all you need to do is commit your code, create a staging server and deploy with ```git push```.

Martin recommends [Heroku](http://heroku.com) as the ideal candidate for deployment to a cloud staging server. The Heroku gem is included in the Gemfile by default. A Procfile is also included to ensure Martin will play nice with Heroku's new cedar stack.

```
$ git init
$ git add .
$ git commit -m 'init'
$ heroku create --stack cedar
$ heroku addons:add logging
$ heroku addons:add shared-database
$ git push heroku master
$ heroku run rake db:bootstrap
$ heroku open; heroku ps; heroku logs --tail
```

## Credit

Martin is heavily inspired by [Sammy Davis Junior](https://github.com/kyledrake/sammy_davis_jr). After using Sammy as a starting point on a few projects I found myself removing and adding the same things over and over, so I thought I'd create a quick starting point tailored to the needs of the apps I've been writing.

## License

Martin is made available under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
