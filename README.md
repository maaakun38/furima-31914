# DB 設計

## users table

| Column             | Type         | Options            |
|--------------------|--------------|--------------------|
| nick_name          | string       | null: false        |
| email              | string       | null: false        |
| password           | string       | null: false        |
| first_name         | string       | null: false        |
| last_name          | string       | null: false        |
| birth_year         | string       | null: false        |
| birth_month        | string       | null: false        |
| birth_day          | string       | null: false        |

### Association

* has_many :products
* has_many :purchase
* has_many :comments

## products table

| Column               | Type       | Options           |
|----------------------|------------|-------------------|
| title                | string     | null: false       |
| price                | string     | null: false       |
| description          | text       | null: false       |
| seller_name          | references | null: false       |
| category             | string     | null: false       |
| condition            | string     | null: false       |
| shipping_charge      | string     | null: false       |
| shipping_area        | string     | null: false       |
| shipping_date        | string     | null: false       |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## purchase table

| Column             | Type        | Options            |
|--------------------|-------------|--------------------|
| user_id            | references  | null: false        |
| product_id         | references  | null: false        |
| buyer_id           | references  | null: false        |

### Association

- belongs_to :user
- belong_to  :product
- has_one :buyer

## buyer table

| Column               | Type       | Options           |
|----------------------|------------|-------------------|
| postal_code          | string     | null: false       |
| prefecture           | string     | null: false       |
| municipality         | string     | null: false       |
| address              | string     | null: false       |
| building             | string     |                   |
| phone_number         | string     | null: false       |

### Association

- belongs_to :purchase

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| user_id     | references | foreign_key: true |
| product_id  | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product