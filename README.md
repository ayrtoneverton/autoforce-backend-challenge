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
