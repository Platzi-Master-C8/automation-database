# Deployment of a PostgreSQL Database in Heroku 

This is how was created the database for Automation Cell in Heroku-Postgres.

## 1 Set a Postgres Database
1. Create a new Heroku app.
2. Add a PostreSQL database:
	*  Navigate to the Resources tab in the header of your newly created app's dahsboard. 
	*  Then type Heroku Postgres into the Add-ons search field.When shown, select the suggested Heroku Postgres add-on from the dropdown.
	*  The next popup asks you to choose a pricing plan for the database. Select the Hobby Dev - Free plan and click Provision.
3. Access the database credentials (and connection URL)
	* Navigate to the Resources tab in your app's dashboard again and select the Heroku Postgres resource.
	* Now select the Settings tab in the header of that screen.
	* Here, you can click the View Credentials button to see the credentials of your PostgreSQL database.

