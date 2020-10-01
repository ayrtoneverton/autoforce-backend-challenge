# AutoForce - Backend Challenge

Challenge requirements: [API_REQUIREMENTS.md](API_REQUIREMENTS.md)

Challenge proposed by: https://autoforce.com

Challenge proposed in: https://github.com/autoforce/backend-challenge


# Entities

Class diagram:

![](db/class_diagram.jpg)

**Future improvement:** Analyze the best way to work with the "line_items" field.


# API endpoints

### POST: /orders - Create a new Order

Parameters:
 * reference: String!
 * address: String!
 * line_items: String!
 * total_value: Real!
 * user_id: ID!
 * purchase_channel_id: ID!
 * delivery_service_id: ID!

Notes: order.status = ready

Result: Order


### GET: /orders - Get the status of an Order and List the Orders of a Purchase Channel

Parameters:
 * reference: String
 * user_id: ID
 * status_id: ID
 * purchase_channel_id: ID
 * delivery_service_id: ID
 * offset: Integer
 * limit: Integer

Result: [Order]!


### POST: /batches - Create a Batch

Parameters:
 * purchase_channel_id: ID!

Notes:
 * batch.reference = "YYYYMM-increment"
 * batch.orders.status = production

Result: { reference: String, count_orders: Integer }!


### PATCH/PUT: /batches/$id - Produce a Batch and Close part of a Batch for a Delivery Service

Parameters:
 * $id: ID!
 * delivery_service_id: ID

Notes:
```
if delivery_service_id:
  batch.orders[delivery_service].status = sent
else:
  batch.orders.status = closing
```

Result: { count_orders_moved: Integer }!


### GET:/report - A simple financial report

Result: [PurchaseChannel: { id: ID, name: String, count_orders: Integer, sum_total_orders: Real }]!


# Additional Stuff

* A security layer, to prevent script kiddies from messing up our Orders and putting on YouTube.
  * A part has already been done, the "rack-attack" gem has been added, and it already limits some things, but it needs to be better configured, in addition to evaluating more security test cases.

* A permission layer, that way we can be sure that each user is only working with their stuff.
  * For this point it would be very important to have a more in-depth analysis of the applications that use this API, and then to analyze the best permission structure, so as not to create a very complex structure for a simple application.

* Sometimes people confuses Moto G5 with Moto G5S and we need a way to modify Orders in production.
  * It would simply create a new endpoint allowing for the necessary changes.

* A web UI to control everything directly, without the need of going thought the API.
  * I would use some front-end technology, like React JS, to create an application that would implement business rules using this API.


# Project

Ruby on Rails Project.

Install dependencies:
```SH
$ bundle install
```

**Database:** Postgres

SQL Example:
```SQL
CREATE DATABASE autoforce_backend_challenge_development;
```

Create database structure:
```SH
$ rails db:migrate
```

**Note:** The only entity that is already populated is the status. I recommend creating using the "rails c" command.
