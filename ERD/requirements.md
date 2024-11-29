## airbnb database design requirements
### Entity Relationship Diagram built using dbdiagram.io (https://dbdiagram.io)

```dbdiagram.io design script
    Table users {
        user_id uuid [primary key]
        first_name varchar
        last_name varchar
        email varchar [unique]
        password_hash varchar
        phone_number varchar [null]
        role enum('admin', 'host', 'guest')
        created_at timestamp [default: "CURRENT_TIMESTAMP"]
    }

    Table properties {
        property_id uuid [primary key]
        host_id uuid [ref: > users.user_id]
        name varchar
        description text
        location varchar
        pricepernight decimal
        created_at timestamp [default: "CURRENT_TIMESTAMP"]
        updated_at timestamp [default: "CURRENT_TIMESTAMP", note: "ON UPDATE CURRENT_TIMESTAMP"]
    }

    Table bookings {
        booking_id uuid [primary key]
        property_id uuid [ref: > properties.property_id]
        user_id uuid [ref: > users.user_id]
        start_date date
        end_date date
        total_price decimal
        status enum('pending', 'confirmed', 'canceled')
        created_at timestamp [default: "CURRENT_TIMESTAMP"]
    }


    Table payments {
        payment_id uuid [primary key]
        booking_id uuid [ref: > bookings.booking_id]
        amount decimal
        payment_date timestamp [default: "CURRENT_TIMESTAMP"]
        payment_method enum('credit_card', 'paypal', 'stripe')
    }

    Table reviews {
        review_id uuid [primary key]
        property_id uuid [ref: > properties.property_id]
        user_id uuid [ref: > users.user_id]
        rating int [note: "1 <= rating <= 5"]
        comment text
        created_at timestamp [default: "CURRENT_TIMESTAMP"]
    }

    Table messages {
        message_id uuid [primary key]
        sender_id uuid [ref: > users.user_id]
        recipient_id uuid [ref: > users.user_id]
        message_body text
        sent_at timestamp [default: "CURRENT_TIMESTAMP"]
    }
```