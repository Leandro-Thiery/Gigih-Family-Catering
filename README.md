# Gigih Family Catering

**Name** : Leandro Thiery

**ID** : P_G2BE2058

## Important Notes:

- This rails project doesn’t use the views **yet**, so response will be returned in JSON

## API List:

### Category

**URL** : `/categories/`

**Method** : `GET`

**Data example**

```json
{
    "categories": [
        {
            "id": 1,
            "name": "Makanan"
        },
        {
            "id": 2,
            "name": "Minuman"
        },
        {
            "id": 3,
            "name": "Lokal"
        }
    ]
}
```

**URL** : `/categories/:id`

**Method** : `GET`

**Data example**

```json
{
    "id": 1,
    "name": "Makanan"
}
```

### MenuItems

**URL** : `/menu_items/`

**Method** : `GET`

**Data example**

```json
{
    "menu_items": [
        {
            "id": 1,
            "name": "Nasi Uduk",
            "price": 10000.0,
            "description": null
        },
        {
            "id": 2,
            "name": "Es Teh",
            "price": 5000.0,
            "description": null
        }
    ]
}
```

**URL** : `/menu_items/:id`

**Method** : `GET`

**Data example**

```json
{
    "id": 1,
    "name": "Nasi Uduk",
    "price": 10000.0,
    "description": null,
    "categories": [
        "Makanan",
        "Lokal"
    ]
}
```

### Orders

**URL** : `/orders/`

**Method** : `GET`

**Data example**

```json
{
    "orders": [
        {
            "id": 1,
            "total": 15000.0,
            "status": "NEW",
            "name": "Leandro",
            "email": "leandro@gmail.com"
        },
        {
            "id": 2,
            "total": 20000.0,
            "status": "NEW",
            "name": "Thiery",
            "email": "thiery@gmail.com"
        }
    ]
}
```

**URL** : `/orders/`

**Method** : `POST`

**Body example**

```json
{
    "customer_id": 1,
    "details": [
        {
            "menu_item_id": 1,
            "quantity": 1
        },
        {
            "menu_item_id": 2,
            "quantity": 2
        },
    ]
}
```

**URL** : `/orders/:id`

**Method** : `GET`

**Data example**

```json
{
    "id": 1,
    "total": 15000.0,
    "status": "NEW",
    "name": "Leandro",
    "email": "leandro@gmail.com",
    "order_details": [
        {
            "item_name": "Nasi Uduk",
            "categories": [
                "Makanan",
                "Lokal"
            ],
            "price": 10000.0,
            "quantity": 1
        },
        {
            "item_name": "Es Teh",
            "categories": [
                "Minuman"
            ],
            "price": 5000.0,
            "quantity": 1
        }
    ]
}
```

**URL** : `/orders/:id`

**Method** : `PATCH`

**Body example**

```json
{
    "id": 1,
    "status": "one of ['NEW', 'PAID', 'CANCELED']"
}
```