# テーブル設計

## usersテーブル

| Column    | Type         | Options             |
| --------- | ------------ | ------------------- |
| name      | string       | null: false         |
| email     | string       | null: false         |
| password  | string       | null: false         |

### Association
- has_many: customers
- has_many: blogs

## customerテーブル

| Column        | Type         | Options                        |
| ------------- | ------------ | ------------------------------ |
| last_name     | string       | null: false                    |
| first_name    | string       | null: false                    |
| last_name_kana| string       | null: false                    |
| first_name    | string       | null: false                    |
| postal_code   | string       | null: false                    |
| prefecture_id | integer      | null: false                    |
| city          | string       | null: false                    |
| house_number  | string       | null: false                    |
| building_name | string       |                                |
| phone         | string       |                                |
| product_name  | string       |                                |
| amount_money  | integer      |                                |
| start_time    | datetime     | null: false                    |
| purchase_date | date         |                                |
| remark_column | text         |                                |
| user          | references   | null:false, foreign_key: true  |

### Association

- belongs_to: user
- has_many: blogs

## blogテーブル

| Column        | Type         | Options                        |
| ------------- | ------------ | ------------------------------ |
| user          | references   | null:false, foreign_key: true  |

- belongs_to: user
- has_many: customers




