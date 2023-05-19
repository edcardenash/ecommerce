## E-Commerce API

This API is an e-commerce application built with Ruby on Rails.

## Description

This e-commerce API allows users to interact with product and purchase data. The main components of the API include:

1. **ProductsController**: This controller provides endpoints to retrieve product data. It has two key actions: `top_products`, which might return a list of the most popular or best-selling products, and `top_revenue_products`, likely providing a list of products generating the most revenue.

2. **PurchasesController**: This controller offers endpoints related to purchases. The `index` action likely returns a list of all purchases. The `purchases_by_granularity` action allows querying purchases with certain granularity, possibly for sales analysis purposes.

3. **Authentication**: The API employs JSON Web Tokens (JWT) for request authentication. This allows the application to securely identify admins and ensure they have proper permissions to perform certain actions.

4. **Tests**: The application comes with a testing suite built with RSpec, a testing framework for Ruby. This suggests adherence to software development best practices as testing helps ensure the application's code works as expected.

## Setup and Installation

Follow these steps to get the server up and running:

1. **Clone the repository**:

    ```
    git clone https://github.com/edcardenash/ecommerce.git
    ```

2. **Change into the new directory**:

    ```
    cd ecommerce
    ```

3. **Install dependencies**:

    ```
    bundle install
    ```

4. **Setup the database**:

    ```
    rails db:setup
    ```

5. **Start the server**:

    ```
    rails server
    ```

6. **Generate JWT Secret Key**:

    ```
    rake secret
    ```

    Save the generated secret key for JWT in your environment variables as `JWT_SECRET`.

The application should now be running at `localhost:3000`.

Note: This API is designed to work with Ruby version 2.6.3 and Rails 6.1.0. It may not function as expected with other versions of Ruby and Rails.
