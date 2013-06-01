better-php-migrations
=====================

I've taken some parts of other migrations frameworks, and put together a very simple, small, versatile, and easy to use framework which runs on PHP and MySQL


How to use:


You can choose to navigate to the parent directory in your browser, and run the migrations from the web interface, or you can just run them from the command line with:
   php index.php run
 
The format for new migration files is:
-put just the .sql file within the /migrations/migrations/ folder, with the format:
    {index}_any_name_you_want.sql
-the index should be numeric and in order so the system can maintain it's dependencies.

You can configure your specific database settings in /migrations/lib/migrations.php, at the top of the file.

Right now the framework just keeps track of which .sql files are the in the /migrations folder. When you run migrations, it puts these filenames in the migrations schema table. Very simple.

There is no 'back' feature as of yet. More features to come...
