## Morth Inventory Tracking

Morth Inventory Tracking: MongoDB Server Connected to Inventory Tracking SPA
=======================

This NoSQL Database was developed to store and relay information to an inventory management SPA.

---

## Table of Contents

 - Important Links
 - Planning Story
 - User Stories
 - Technologies Used
 - Unsolved Problems
 - Entity Relationship Diagram

---

## Important Links

[Deployed Client](https://ttamsmas.github.io/Morth_IT-ttamsmas/)

[Heroku git URL](https://git.heroku.com/morthinventorytracking.git)

[Client Repository](https://github.com/ttamsmas/Morth_IT-ttamsmas)

[Server Repository](https://github.com/ttamsmas/Morth_Inventory_Tracking)

## Planning Story

The goal of this document is to track inventory items and authenticated users within a NoSQL Database. Inventory items are to be owned by users, so they need to contain user ids representing item ownership. With these considerations, I mapped out a plan for developing the server.

Development Plan
----------------

 - Create a standard NoSQL Server using Express, CORs, and Mongoose
 - Setup Pathways for items and user authentication including error handlers, hashed password protocols, and connections to the Models, Schema, and Routes
 - The Schema for the Users and Items need to be customized to capture the appropriate fields for inventory management with ownership
  1. The Inventory Item Schema should include standard fields e.g. name, cost, and timestamps
  2. In addition to standard fields, virtual fields like price calculated from cost
  3. Ownership within Items will eventually correlate to User ID Fields but for now creating an ownership field within the item schema is enough
- Establish Routes for both Item and User requests including GET, POST, PATCH, SHOW, INDEX, & DELETE
- Establish Ownership Logic within Item Routes to prevent unauthorized use of the server
- Test Route Responses by testing the SPA side AJAX Requests

## User Stories

  1. As a security focused user, I want authentication to require making an account and incorporating a hashed password
  2. I am focused on inventory addition so I want users to be able to create items with as few fields as possible and I want the item to be viewable once I have submitted it.
  3. As a user focused on recurring inventory quantity counts, I want to be able to directly adjust the quantity, ideally without needing to copy and paste an item id

## Technologies Used

- MongoDB with Mongoose
- CORs, Chalk, and Express Middleware
- Javascript & JQuery

## Unsolved Problems

This document is not setup to patch all fields within items, for proof of concept only update quantity was developed because it is incorporated into the SPA inline with each inventory item.

User ownership is functioning, however, administrative levels would make the program more usable.

More virtual fields could be developed like the age of inventory by manipulating item's timestamps from within the Item Schema's virtual properties.


## Entity Relationship Diagram

[ERD Point of Sale](https://imgur.com/WfsjiAG)
