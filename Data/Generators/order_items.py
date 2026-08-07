import random
import pandas as pd

from Data.Config.settings import (
    CSV_FOLDER,
    NUM_ORDER_ITEMS,
    ORDER_ID_START,
    PRODUCT_ID_START
)

from Data.Generators.utils import save_csv


def generate_order_items():

    order_items = []

    for _ in range(NUM_ORDER_ITEMS):

        order_items.append(
            {
                "Order_Id": random.randint(
                    ORDER_ID_START,
                    ORDER_ID_START + 4999
                ),

                "Product_Id": random.randint(
                    PRODUCT_ID_START,
                    PRODUCT_ID_START + 99
                ),

                "Quantity": random.randint(
                    1,
                    5
                ),

                "Unit_Price": round(
                    random.uniform(100, 50000),
                    2
                )
            }
        )


    df = pd.DataFrame(order_items)

    output_file = CSV_FOLDER / "OrderItems.csv"

    save_csv(df, output_file)


if __name__ == "__main__":
    generate_order_items()