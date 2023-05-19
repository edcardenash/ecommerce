#!/bin/bash

echo "Authenticating admin..."
TOKEN=$(curl -s -X POST -H "Content-Type: application/json" -d '{"admin": {"email": "admin_email", "password": "admin_password"}}' http://localhost:3000/api/v1/admins/sign_in | jq -r '.token')

echo "Token: $TOKEN"

echo "Getting top products..."
curl -H "Authorization: Bearer $TOKEN" http://localhost:3000/api/v1/products/top_products

echo "Getting top revenue products..."
curl -H "Authorization: Bearer $TOKEN" http://localhost:3000/api/v1/products/top_revenue_products

echo "Getting purchases..."
curl -H "Authorization: Bearer $TOKEN" http://localhost:3000/api/v1/purchases

echo "Getting purchases by granularity..."
curl -H "Authorization: Bearer $TOKEN" http://localhost:3000/api/v1/purchases/purchases_by_granularity
