
create_file "log/.gitkeep"
create_file "tmp/.gitkeep"

git :init

gitignore = <<-GITIGNORE
*~
.*.sw?
.DS_Store
.\#*
.bundle
.rvmrc*
\#*
database.yml
db/*.sqlite3
log/*.log
tmp/**/*
GITIGNORE

remove_file '.gitignore'
create_file '.gitignore', gitignore

git :add => "."

