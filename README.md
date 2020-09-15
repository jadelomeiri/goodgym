# CTO Technical Test
## Brief
GoodGym organises sessions where you do good and get fit all across the UK. With the COVID-19 crisis we have to restrict the numbers of attendees at each session for safety concerns.

Many of our sessions become fully booked which causes issues for us as:
- if someone pulls out of a session at the last minute other users might not be aware of this
- once a session is fully booked we can’t tell how much interest there would have been in that session

We would like you to implement waiting list functionality for our sessions so that:
- once a session has reached its registration limit, users can sign up for a waiting list place
- if a user cancels their registration for a session, a user on the waiting list is bumped up to take their place


### Background
We can expect the following concepts in our domain.
```
User
- name
Session
- started_at
- registration_limit
- registrations
Registration
- user
- session
```
You will be adding the waiting list functionality to this domain.

### Instructions
Please implement this feature using Ruby on Rails if possible.
Please consider providing suitable documentation (e.g. a README) and tests.
We’re not expecting you to take days to build this - ideally this should take no more than a few hours. We’re looking for a functional, well tested solution.

<hr>

# Solution
## 1- Technologies
Ruby on Rails is the web framework used at googdym, hence my final solution is a RoR web app. 
### Versions used:
| Technology | Version   |
| ---------- | --------- |
| Ruby       | 2.7.1     |
| Rails      | 6.0.3.3   |
| Node       | 12.8.3    |
| Yarn       | 1.22.5    |
| SQLite     | 3.33.0    |

## 2- Assumptions & Design Decisions
Throughout the project I tried to follow the <strong>KISS principle</strong> and tried to <strong>not over-engineer</strong> things. <br>
Main focus was primarily on the user, and no features have been developed for admin purposes. 

We assume admins will pre-populate data or connect directly to the db if needed.

We assume we don't need to keep track of which users cancelled their registrations. 
When a user unregisters, the registration will simply be deleted from the db.

We assume the users needs to be notified by email once their registrations are confirmed (after being on the waiting list).

### Domain Modelling
My domain model is fairly simple and is based on the instructions given above.<br>
It consists of 3 model classes: <b>User, Run, Registration</b>.

<u>Note:</u> we use Run instead of Session. This is to avoid confusion with the technical word 'session'. Session is in turn being used for authentication functionality.

Here's how our model mainly looks like:
```
# Note: this snippet is showing fields of interest only 
User
- name
- email
- password

Runs
- starting_at
- registration_limit
- registrations_booked # how many times this run has been booked

Registration
- user
- run
- confirmed # has this registration been confirmed or is the user still on the waiting list?
- created_at # helps up know who's first on the waiting list
```

## 3- Testing:
Unfortunately due to technical issues, not automated testing was done.
Ideally we should at least have the following tests (in order of importance):
- Unit test models
- Integration tests for controllers
- End to en tests for the whole system including the UI

The solution has been thoroughly tested manually.

## 4 - Running the app:
### Commands
From your terminal
<strong>cd</strong> to the project directory.

Then type the following command:

    rails db:fixtures:load RAILS_ENV=development # to load fixture data
    rails server # to run the app

## 5 - Improvements:
- Add automated tests
- Stop users from registering to past runs
- Add admin functionality

# Many thanks!
    


