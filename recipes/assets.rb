namespace :pipe do

  desc "Removes precompiled assets"
  task :remove, roles: :web do
    puts "Removing assets..."
    system "rm public/assets/application.js"
    system "rm public/assets/application.css"
    system "rm public/assets/application.js.gz"
    system "rm public/assets/application.css.gz"
  end

  #before "deploy", "pipe:precompile"
  #after "deploy", "pipe:remove"
  #before "deploy", "check:revision"
  #before "deploy:migrations", "check:revision"
  #before "deploy:cold", "check:revision"
end