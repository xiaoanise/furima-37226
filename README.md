# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_year         | date   | null: false               |
| birth_month        | date   | null: false               |
| birth_day          | date   | null: false               |

### Association
- has_many :items
- has_many :orders

## items テーブル
| Column             | Type       | Options                        |
| ------             | ------     | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | references | null: false, foreign_key: true |
| condition_id       | references | null: false, foreign_key: true |
| postage_payer_id   | references | null: false, foreign_key: true |
| prefecture_id      | references | null: false, foreign_key: true |
| preparation_day_id | references | null: false, foreign_key: true |
| price              | integer    | null: false                    |
| seller_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :seller, class_name: "User"
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :preparation_day

## orders テーブル
| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| buyer_id   | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |

### Association
- belongs_to :buyer, class_name: "User"
- belongs_to :item
- has_one :address

## addresses テーブル
| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| order_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :order

## categories テーブル
| Column   | Type       | Options             |
| -------  | ---------- | ------------------- |
| category | string     | null: false         |

### Association
- has_many :items

## conditions テーブル
| Column    | Type       | Options             |
| -------   | ---------- | ------------------- |
| condition | string     | null: false         |

### Association
- has_many :items

## postage_payers テーブル
| Column        | Type       | Options             |
| -------       | ---------- | ------------------- |
| postage_payer | string     | null: false         |

### Association
- has_many :items

## preparation_days テーブル
| Column          | Type       | Options             |
| -------         | ---------- | ------------------- |
| preparation_day | string     | null: false         |

### Association
- has_many :items

## prefectures テーブル
| Column     | Type       | Options             |
| -------    | ---------- | ------------------- |
| prefecture | string     | null: false         |

### Association
- has_many :items
- has_many :addresses