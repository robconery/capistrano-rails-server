## Tekpub.com Server Build Files

This project contains all of the server build files (Capistrano recipes) for our Full Throttle video on building an Azure VM for Rails. The inspiration and source for these files is from [Railscasts.com](http://railscasts.com/episodes/337-capistrano-recipes) so please please please, if you find these helpful [go sign up for Railscasts Pro](http://railscasts.com/pro).

## What's Inside

These cap recipes are very easy to use and a sample deploy.rb file is provided for you. You can watch our video for more on how to use, or just have a look at the recipes to see what they do.

Assuming you're using Ubuntu 12.x, these scripts will install:

 * An nginx web server using the latest build
 * Postgresql latest
 * Unicorn (for running Rails behind nginx)
 * Memcached and Redis for caching etc
 * vsftpd (FTP server) for loading up files

A pretty standard all-in-one Rails server. Please note that if you're deploying to a web farm, you'll want to remove the postgresql recipe and the redis one as well.

## Usage

To see what tasks you have available to you, just run `cap -T` from the command line and you'll see a big list of things you can do. Capistrano will build your server for you, setup your deployment environment, transfer your db files, configure nginx, start/stop Unicorn and a slew of other things.

**We did not create this** - we have forked/altered what [http://railscasts.com](Ryan Bates) has done previously. These recipes are [available all over the web](http://viget.com/extend/building-an-environment-from-scratch-with-capistrano-2) and there is a lot you can do with Capistrano. This is possibly too much, but we find it incredibly helpful.

To use these scripts you'll need to do a few things first:

 * Install Ubuntu 12.x
 * Login and create a "deployer" account with root privvies
 * Push your SSH key to `~/.ssh/authorized_keys` so you don't have to keep entering your password

Once all of this is complete, run `cap deploy:install` to have your server setup for you. If it fails (and it likely will) fix the problem and then rerun the cap task. **Please note: we're not supporting these scripts**. If you have a problem it will be up to you to solve it - these scripts work for us and have been highly tailored to the task... as you can imagine we can't spend our time helping you build your server :).

When `cap deploy:install` is completed, your server has been built! Next you need to setup and configure your site - to do that run `cap deploy:setup`. Your DB will be created and nginx configured. If nginx fails to start, make sure recipes/templates/nginx_unicorn has what it needs to run (SSL certificates etc). You may need to go bare-bones and slowly change the scripts over time.

**Warning**. If you update your Gemfile and your site fails to start, you may need to hard stop/start Unicorn. We've run into this problem a few times - a restart will not install new gems for Unicorn to use so you'll need to `cap unicorn:stop` and `cap unicorn:start`.

## This Was Recorded

We installed our Rails machine (4 of them in all) using these scripts and we recorded the process up at Tekpub.com. We invite you to have a watch!

