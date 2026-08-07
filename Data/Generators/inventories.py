import random
import pandas as pd

from Data.Config.settings import (
    CSV_FOLDER,
    STORE_ID_START,
    PRODUCT_ID_START,
    NUM_PRODUCTS,
    NUM_STORES
)

from Data.Generators.utils import save_csv


def generate_inventories():

    inventories = []

    for store_id in range(
        STORE_ID_START,
        STORE_ID_START + NUM_STORES
    ):

        for product_id in range(
            PRODUCT_ID_START,
            PRODUCT_ID_START + NUM_PRODUCTS
        ):

            inventories.append(
                {
                    "Store_Id": store_id,

                    "Product_Id": product_id,

                    "Quantity": random.randint(
                        0,
                        500
                    )
                }
            )


    df = pd.DataFrame(inventories)

    output_file = CSV_FOLDER / "Inventories.csv"

    save_csv(df, output_file)


if __name__ == "__main__":
    generate_inventories()