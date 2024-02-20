# delivery-tracker-1

Target: https://delivery-tracker-1.matchthetarget.com

CODING NOTES start at app/controllers/application_controller.rb

1. Setting up back-end: using draft:resource for DELIVERY database -> Important: make sure that the columns defined in the database is identical to the variables defined in the command: rake sample_data. You can find this command in lib/tasks/dev.rake

  a. rails generate draft:resource delivery description:string supposted_to_arrive_on:date details:text user_id:integer arrived:boolean

2. Initializing Devise: follow the prompt after using the command then restart bin/dev to finalize initialization.

  a. rails generate devise:install

3. Setting up back-end pt. 2: using Devise for USER database

  a. rails generate devise user

4. Migrations - use the command: rake db:migrate to create the RCAVs (includes Devise RCAVs)

  a. rake db:migrate
