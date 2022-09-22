<div align="center">
<img src="https://media.giphy.com/media/3oz8xFA1SJJZd8Bkly/giphy.gif" alt="tea time" width="30%"/>
<h1 align="center">Tea Subscription</h3>


<p align="center">
  TeaSub is a service-oriented Application that exposes API endpoints for tea subscription. This app allows users to view all of their subcriptions, create a new subscription, as well as cancel or reactivate an existing subscription.
    <br />
    <br />
    <a href="https://github.com/jenniferhalloran/whether-sweater/issues">Report Bug</a>
    ·
    <a href="https://github.com/jenniferhalloran/whether-sweater/issues">Request Feature</a>
  </p>
</div>

## Schema
![Screen Shot 2022-09-22 at 12 20 17 PM](https://user-images.githubusercontent.com/48455658/191800241-8c8c2ca6-6b37-4b5a-a241-fc24d2c97016.png)

## Endpoints

### Create a Subscription

#### Request: 
```
POST http://localhost:3000/subscriptions
Content-Type: application/json
Accept: application/json
params: {
        "customer_id": 2,
        "tea_id": 1,
        "subscription_type": 0
      }
```

#### Sample Response:
<img width="693" alt="Screen Shot 2022-09-22 at 12 49 30 PM" src="https://user-images.githubusercontent.com/48455658/191805992-97a2cdd9-2e37-453e-8476-e1785e82c047.png">

### Update a Subscription

#### Request: 
```
PATCH http://localhost:3000/api/v1/subscriptions/#{SUBSCRIPTION_ID}
Content-Type: application/json
Accept: application/json
params: {
        "active": false
      }
```

#### Sample Response:
![Screen Shot 2022-09-22 at 12 58 22 PM](https://user-images.githubusercontent.com/48455658/191807581-751f9296-52c1-4da8-af2c-7fae2ed0e8bb.png)


### Get All Subscriptions for a User

#### Request: 
```
PATCH http://localhost:3000/api/v1/customers/#{CUSTOMER_ID}/subscriptions"
Content-Type: application/json
Accept: application/json
```

#### Sample Response:
![Screen Shot 2022-09-22 at 1 30 45 PM](https://user-images.githubusercontent.com/48455658/191813344-c986ce36-3d10-400a-92ad-c2b34f05cc99.png)


