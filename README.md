#DUO
<hr>

<strong>Duo</strong> is a web application built to bring us together. Let's pair.

created by:
Jeff Belser (<a href="http://www.twitter.com/justaboutjeff">@JustAboutJeff</a>)

##Objectives

We'd like you to build a **fully-functional web app** that solves a real problem that we run into at the IFTTT office.

Sometimes when you work on big software projects like IFTTT, you find yourself interacting with certain teammates a lot more than others. This is just a natural consequence of having lots of things to do and having people with different specialties.

To mix things up a bit, IFTTT keeps an informal tradition that we call **1+1**: once a week, we split everyone up into pairs, and each pair goes off to do something fun, like hopping on the train to go eat chicken and waffles. We try to make sure we pair up with different people each week. It's a way for us not to lose track of each other, even if we're not all working on the exact same thing.

Currently the process of pairing people up is manual, but as we bring on more people it would be pretty nice to automate it. In this project, you'll implement a web application that will **automatically generate the 1+1 pairings for a given week.**

  1. This web app is designed for a single **organization**.
  2. An organization is made up of **people**.
     - Each person has a **name** and a unique **email address**.
  3. The people in an organization are divided up into several **teams**.
     - Each team has a unique **name**.
  4. People and teams have a **many-to-many relationship**: one person can belong to multiple teams.
  5. If Person A and Person B belong to the same team, they are **teammates**.
  6. A weekly **1+1 pair** must consist of two people who are teammates.

#### Example

Consider the following example organization and its pairings for a particular week:

    Team 1
      Elizabeth
      Sophia
      Ludwig*
      Vinny
      Stacey

    Team 2
      Angela
      Casey
      William
      Ludwig*

      * Note that Ludwig belongs to two teams.

    Team 1 Pairings
      Elizabeth <> Vinny
      Sophia <> Stacey

    Team 2 Pairings
      Angela <> Casey
      William <> Ludwig

#### Things to consider

We want as many people to participate as possible and we want to mix things up as much as possible. How smart can you make your implementation? You might find the following non-exhaustive requirements impossible to adhere to one-hundred percent of the time, but they are exemplary of what an ideal implementation would achieve:

  - Every person in the organization should participate in a 1+1 pair each week.
  - Every person should only participate in a *single* 1+1 pair per week (remember, people can be members of multiple teams).
  - The same two teammates should not be paired together in consecutive weeks.
  - Teammates should be paired with equal frequency: if **A** and **B** are paired together this week, **A** shouldn't be paired with **B** again until **A** has paired with every other person on the team.

#### Requirements

Your web app should allow the user to do the following:

  - **Create** and **delete** people.
  - **Create** and **delete** teams.
  - **Insert** people into teams.
  - **Remove** people from teams.

Every Friday at 5:00PM, it should deliver an email to each person with their 1+1 pairing(s) for the next week.

You should use Ruby or server-side JavaScript to develop your app. You don't have to deploy your app online, but you should make sure that it actually works.

You should supply a README that covers the following topics:

  - Instructions on how to run and use your app
  - What design decisions you made
  - How you tested your app

  For more information please contact Jeff@JustAboutJeff.com