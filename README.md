# Spot-A-Cop

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This app will mark speed trap locations on a map based off of user input. It will alert users if they are nearing a speed trap location.

### App Evaluation
- **Category:** Travel / Lifestyle
- **Mobile:** App would be primarily mobile first with a companion website. We want the user to be able to alert other users of speed traps while on the go and alert users if they are nearing a speed trap. The companion website would allow users to view existing speed traps and plan accordingly.
- **Story:** App lets user drop pins on a map to show a speed trap location, this will alert any users near the location of a potential speed trap and avoid any fines.
- **Market:** Anyone looking to avoid getting speeding tickets.
- **Habit:** Users would check the app/companion site before going out. User would use the app after sighting a speed trap.User would have the app open to be alerted of any speed traps nearby while driving.
- **Scope:** V1 User will be able to set pins to mark speed trap locations. User's will be able to view other's pins. V2 User would be alerted if aproaching a speed trap. User's can comment on each other pins and rank users.V3 User can set a pin with voice commands.

## Product Spec

### 1. User Stories

**Required Must-have Stories**

* User can create an account entering email, password, phone number, or by using facebook.
* User can search for pins on a map.
* User can set pins on a map.
* App would alert user approaching a speed trap

**Optional Nice-to-have Stories**

* User's can rank other users. Users can comment on other's pins.
* User can set a pin with voice commands.
* User can attach a picture of the exact speed trap location

### 2. Screen Archetypes

* Login screen
   * User can login to an existing account or be directed to the signup screen
* Signup screen
   * User can sign up for an account by suppliying email,password, phone number, or Facebook/Gmail information.
* Map screen
   * Lets users view existing pins or set a pin.
   * User can see the most common speed trap locations.


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Common location map
* Live map
* Settings
* Logout

**Flow Navigation** (Screen to Screen)

* Login -> Sign up if no account has been created
* Common location map -> Live map
* Settings

## Wireframes

### Digital Wireframes & Mockups
<img src="https://i.imgur.com/NoeCE47.png" width=600>

### Interactive Prototype
<img src="http://g.recordit.co/t0LdILeiRi.gif" width=600>

## Schema 
### Models
#### User

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | Username      | String   | Unique hashed id for the user |
   | Password      | String   | Hashed password for the user|
   | Email         | String   | Hashed email for the user |
   
### Networking
**List of network requests by screen**
* Map Screen
  * (Read/Get) Display most popular user pins
  * (Create/Post) User can set a  pin on the map

- [Create basic snippets for each Parse network request]


