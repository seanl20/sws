### Problem
Migrating the sws.sqlite3 databog to rails was giving some issue where for the ruby on rails sqlite3 functionality does not have UUID compability so I had to recreate the data table migrations and seed it.

### Solutions
First I create the migrations for the company, company scores and company price closes tables.
Once that is done I made use of visual code studio extensions to view the sqlite3 file.

![Extensions](..\lib\images\extensions.png)

Once I have those extension I opens the sqlite3 and export to csv.

![Exports](..\lib\images\exports.png)

Once I have all three table exported to \lib\csv_files I would need to seed the data to be used into the development.sqlite3 being used.

However to have the sqlite3 accept UUID I would need to set the id column to string and have the UUID generated within models. I used this [website](https://www.amirsharif.com/using-uuid-for-sqlite-in-rails) as help for it.

you can view my solution of the seeding in this file: db/seeds.rb

### Note
There may be a better or easier way for the data migration to rails however I did not want to spent too long to have the database running before even starting on the task.