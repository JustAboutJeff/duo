#DUO

> **Duo** is a web application built to bring us together. Let's pair

- Inspired by: [IFTTT](https://ifttt.com/)
- Created by: **Jeff Belser** [@JustAboutJeff](http://www.twitter.com/justaboutjeff)

##About

Duo is a web application built to help teams connect across a single organization. Organizations are filled with people and teams, associated in a many-to-many relationship.

Duo allows you to create and delete people, create and delete teams, and insert and remove people from teams. Often a person will belong to many different teams, having teammates across the organization.

Every Friday at 5pm Duo generates a new pairing notification for each person by selecting from their available teammates. An individualized pairing notificaion is shared via email to each person in the organization.

**So to recap:**

  - This web app is designed for a single organization.
  - An organization is made up of people.
     - Each person has a name and a unique email address.
  - The people in an organization are divided up into several teams.
     - Each team has a unique name.
  - People and teams have a many-to-many relationship**: one person can belong to multiple teams.
  - If Person A and Person B belong to the same team, they are teammates.
  - A weekly pair must consist of two people who are teammates.

**Duo allows you to:**

  - Create and delete people.
  - Create and delete teams.
  - Insert people into teams.
  - Remove people from teams.

Every Friday at 5:00PM, Duo delivers an email to each person with their pair assignment for the next week.

##Install

- Fork the gist and clone the repo onto your local machine:

		$ git clone https://github.com/JustAboutJeff/duo.git

- Navigate to the application directoy in terminal and run **bundle install** to gather the required gems:

		$ bundle install

- Depending on your development environment, you may need to edit and save out the **.ruby-gemset.sample** and **.ruby-version.sample** files provided within the application directory. Save these without the .sample filetype into your app directory to control the gemset and ruby version.

- Within the app's config directory open the **config.example.yaml** file and define the application token and mailer usernames and passwords for your local configuration. Save a new copy as **config.yaml**. Check the config/environments directory to view the settings these environment variables control:

		GMAIL_USERNAME: 'example'
		GMAIL_PASSWORD: 'example'
		SECRET_TOKEN: 'example'
		SENDGRID_USERNAME: 'example'
		SENDGRID_PASSWORD: 'example'

- Run the rake commands to create, migrate and seed a postgres db:

		$ rake db:create && rake db:migrate && rake db:seed

- Launch the application server:

		$ rails s

- Open a broswer and navigate to **localhost:3000**
- **Enjoy**

##Usage

Once you have the application up and running you can **Sign Up** to create a new user or **Sign In** with an existing user. Try a few of the IFTTT employees and their emails as they have been provided within the seed file:

- email: **linden@ifttt.com**
- password: **password**

Once logged in you will arrive at your **user page** which displays a photo sourced from the gravatar api, your user name and the teams that you are currently assigned to. Using the top navigation, click the **People** or **Teams** links to begin editing the organization.

On the **People page**, you can view a snapshot of the current people and their teams, delete people, and build new people using the form at the top of the page.

On the **Teams page**, you can view the existing teams and their assigned people, update the roster of each team using the checkboxes and submit button, delete teams, or create new teams using the form at the top of the page.

Please consult the production version of the app hosted on heroku for a live demonstration:

<http://duopair.herokuapp.com>

##Design

To design this app I had to first break down the data models and their underlying associations. I decided on creating one Users model to capture both 'application users' and the people that exist within the organization - as in this case they are one and the same. Initially, I constructed a few admin features to control which users could execute CRUD actions, but ultimately decided to follow the brief more closely and allow an open-ended approach. The Teams model is joined with the Users model in a many-to-many association across a TeamMembers join table.

On the Users table things got interesting when creating the logic for the pair assignments. I built out a solution using a belongs_to self referential association to a partner_id. I had to create an instance method helper (set_partner) to create a cyclical relationship on the user's pair as well. Before submitting the app I began to try another approach on a feature branch where I stored the pairing history in a seperate Pairs table associated to the Users table in a has_many relation. The Pairs table could allow me to refine my pairing algorithm by tracking the frequency of pairing relationships between users and track the 'last partner' to prevent a back to back pair assignment with the same person.

- Find the Pairs model feature branch on github [here](https://github.com/JustAboutJeff/duo/pull/30).

To handle the pairing logic, I constructed a DuoCalculator class in the lib directory. I attempted to abstract as much of the logic for building relationships between users into this class as possible. The 'get_duos' method is wrapped in a whenever gem task to run every friday at 5pm, sending pair assignment emails out to everyone in the organization based on the algorithm.

- Find the DuoCalculator class on github [here](https://github.com/JustAboutJeff/duo/blob/master/lib/duo_calculator.rb)

##Testing

To test Duo I wrote a number of specs using rspec (alongside shoulda, and factorygirl) for the controller actions and routes, models and assocations, and mailer and lib classes. I focused on unit testing and plan to write some good integration tests using capybara in the future. Frankly, I would have loved to test this app more thoughourly, especially the pairing logic within the DuoCalculator class as I enjoy the 'reverse-engineering' that takes place when writing solid, effective tests.

Please check out the spec folder within the application directory to view some of the tests that I wrote. To execute the tests you may need to first setup a testing environment by using the following terminal command:

    $ rake db:test:prepare

Once your testing environment is ready run the specs from the terminal within the app directory:

		$ rspec spec -fn

Outside of formal specs, I tested the app across a number of different browsers to inspect my front-end rendering and responsive design. For the email notifications I configured ActiveMailer to use a test gmail account on my local development environment. I also did a bit of UX research with the help of my girlfriend by asking her to use the application and the forms for editing the roster of a team.

##Final Thoughts

Thanks to IFTTT for providing an interesting problem to dive into. I learned a great deal working with the active record self-referential associations and had a blast building out a responsive UI with the Zurb Foundation framework. There were a number of interesting challenges that surfaced while I was working on the app. While I didn't know the perfect solution in every case, I enjoyed researching the issues, asking questions, and testing my solutions. I can already see where this app could be improved and optimized in the future. A few things I'm exctied to work on next:

- Finalize the pairs model feature branch and algorithm
- Implement AJAX handling for the form submissions
- Identify opportunities to use rails 'eager loading' to speed up db queries

===

For more information or questions please contact **Jeff Belser** at <JustAboutJeff@gmail.com>