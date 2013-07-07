#DUO
<hr>

<strong>Duo</strong> is a web application built to bring us together. Let's pair.

Inspired by IFTTT

created by:
Jeff Belser (<a href="http://www.twitter.com/justaboutjeff">@JustAboutJeff</a>)

##About

Duo is a web application built to help teams connect across a single organization. Organizations are filled with people and teams. Often in a many-to-many relationship. Duo allows you to create and delete people, created and delete teams, and insert and remove people from teams. Often a person will belong to many teams, having teammates across different teams. Every Friday at 5pm Duo generates a new pairing notification for each person by selecting from their available team members. The pairing notificaion is shared in an email to each person.

So to recap:

  1. This web app is designed for a single **organization**.
  2. An organization is made up of **people**.
     - Each person has a **name** and a unique **email address**.
  3. The people in an organization are divided up into several **teams**.
     - Each team has a unique **name**.
  4. People and teams have a **many-to-many relationship**: one person can belong to multiple teams.
  5. If Person A and Person B belong to the same team, they are **teammates**.
  6. A weekly **pair** must consist of two people who are teammates.
  
Duo allows you to:
  
  - **Create** and **delete** people.
  - **Create** and **delete** teams.
  - **Insert** people into teams.
  - **Remove** people from teams.

Every Friday at 5:00PM, it should deliver an email to each person with their 1+1 pairing(s) for the next week.

#### Install

Fork the gist and clone onto your local machine

navigate to the application directoy in terminal and run Bundle Install

Open the config.example.yaml file and define the environment variables for your local configuration. Save your new copy as config.yaml

run the rake commands to setup a postgres db:

-- rake db:create && rake db:migrate & rake db:seed

launch the application:

-- rails s

open a broswer and navigate to localhost:3000




TODO: FINISH THIS LAST BIT

#### Requirements

You should supply a README that covers the following topics:

  - Instructions on how to run and use your app
  - What design decisions you made
  - How you tested your app

  For more information or questions please contact Jeff@JustAboutJeff.com