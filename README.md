# DB 設計

## users table

| Column             | Type         | Options                   |
|--------------------|--------------|---------------------------|
| nick_name          | string       | null: false               |
| email              | string       | null: false, unique: true |
| encrypted_password | string       | null: false               |
| first_name         | string       | null: false               |
| last_name          | string       | null: false               |
| first_furigana     | string       | null: false               |
| last_furigana      | string       | null: false               |
| birth_date         | date         | null: false               |

### Association

* has_many :products
* has_many :purchases
* has_many :comments

## products table

| Column               | Type       | Options           |
|----------------------|------------|-------------------|
| title                | string     | null: false       |
| price                | integer    | null: false       |
| description          | text       | null: false       |
| user                 | references | null: false       |
| category_id          | integer    | null: false       |
| condition_id         | integer    | null: false       |
| shipping_charge_id   | integer    | null: false       |
| shipping_area_id     | integer    | null: false       |
| shipping_date_id     | integer    | null: false       |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchases

## purchases table

| Column             | Type        | Options            |
|--------------------|-------------|--------------------|
| user               | references  | null: false        |
| product            | references  | null: false        |

### Association

- belongs_to :user
- belong_to  :product
- has_one :buyer

## buyers table

| Column               | Type       | Options           |
|----------------------|------------|-------------------|
| user                 | references | null: false       |
| postal_code          | string     | null: false       |
| prefecture_id        | integer    | null: false       |
| municipality         | string     | null: false       |
| address              | string     | null: false       |
| building             | string     |                   |
| phone_number         | string     | null: false       |

### Association

- belongs_to :purchases

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| user_id     | references | foreign_key: true |
| product_id  | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product