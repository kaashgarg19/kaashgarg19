# Bike Sales — Results Notes

This note records the results I calculated from the CSV working files in this folder.

It is deliberately separate from the SQL query file because the query file is written for the normalised BikeStores database schema, while the CSV exports are a simpler working representation.

## Data in the folder

- 1,445 customer records
- 4,722 order rows
- 293 product records

## Top five products by revenue

For the CSV version of the exercise, I calculated revenue as:

quantity × price

| Product | Revenue |
|---|---:|
| Trek Slash 8 27.5 - 2016 | 615,998.46 |
| Trek Conduit+ - 2016 | 434,998.55 |
| Trek Fuel EX 8 29 - 2016 | 414,698.57 |
| Surly Straggler 650b - 2016 | 253,829.49 |
| Trek Domane SLR 6 Disc - 2017 | 236,499.57 |

## Customers with the highest order count

The highest order count in these CSV files is 3.

Five customers with that count are:

- Monika Berg
- Saturnina Garner
- Ronna Butler
- Cleotilde Booth
- Williemae Holloway

There are ties, so this is not presented as a unique ranking.

## A small note about the original SQL exercise

The SQL queries use the BikeStores relational structure and calculate discounted revenue from sales.order_items. The results above are from the CSV working files and use their available quantity and price columns.

That distinction is intentional so that the project does not claim that two different representations of the data are identical.
