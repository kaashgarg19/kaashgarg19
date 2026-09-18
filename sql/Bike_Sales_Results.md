# Bike Sales — Results

This is a short results record for the Bike Sales SQL exercise. The figures below were calculated directly from the three CSV files stored in this folder.

## Data used
| File | Rows |
|---|---:|
| Customers.csv | 1,445 |
| Orders.csv | 4,722 |
| Products.csv | 321 |

All 4,722 order rows matched a customer ID and a product ID in the corresponding files.

## Top five products by revenue

Revenue was calculated as quantity × price.

| Rank | Product | Revenue |
|---:|---|---:|
| 1 | Trek Slash 8 27.5 - 2016 | $615,998.46 |
| 2 | Trek Conduit+ - 2016 | $434,998.55 |
| 3 | Trek Fuel EX 8 29 - 2016 | $414,698.57 |
| 4 | Surly Straggler 650b - 2016 | $253,829.49 |
| 5 | Trek Domane SLR 6 Disc - 2017 | $236,499.57 |

## Top five customers by number of orders

| Rank | Customer | Orders |
|---:|---|---:|
| 1 | Tameka Fisher | 13 |
| 2 | Emmitt Sanchez | 12 |
| 3 | Mozelle Carter | 11 |
| 4 | Lyndsey Bean | 11 |
| 5 | Corene Wall | 11 |

## Note

The repository's Orders.csv contains quantity and price, but it does not contain a discount field. This project therefore does not apply a discount calculation used in some versions of the full BikeStores schema.

The purpose of this document is to record the actual output of the SQL exercise rather than add conclusions that are not supported by the data.