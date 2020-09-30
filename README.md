# AutoForce - Backend Challenge

Challenge requirements: [API_REQUIREMENTS.md](API_REQUIREMENTS.md)

Challenge proposed by: https://autoforce.com

Challenge proposed in: https://github.com/autoforce/backend-challenge


# Entities

Class diagram:

![](db/class_diagram.jpg)

**Future improvement:** Analyze the best way to work with the "lineItems" field.


# API endpoints

## POST: /orders - Create a new Order

Parameters:
 * reference: String!
 * address: String!
 * lineItems: String!
 * totalValue: Real!
 * user: ID!
 * purchaseChannel: ID!
 * deliveryService: ID!

Notes: order.status = ready

Result: Order


## GET: /orders - Get the status of an Order and List the Orders of a Purchase Channel

Parameters:
 * reference: String
 * user: ID
 * status: ID
 * purchaseChannel: ID
 * deliveryService: ID
 * offset: Integer
 * limit: Integer

Result: [Order]!


## POST: /batches - Create a Batch

Parameters:
 * purchaseChannel: ID!

Notes:
 * batch.reference = "YYYYMM-increment"
 * batch.orders.status = production

Result: { reference: String, countOrders: Integer }


## PUT: /batches - Produce a Batch and Close part of a Batch for a Delivery Service

Parameters:
 * batch: ID!
 * deliveryService: ID

Notes:
```
if batch.orders.status == closing:
  deliveryService is required
  batch.orders.status = sent
else:
  batch.orders.status = closing
```

Result: Batch


## GET:/report - A simple financial report

Result: [{ purchaseChannel: PurchaseChannel, countOrders: Integer, sumTotal: Real }]
