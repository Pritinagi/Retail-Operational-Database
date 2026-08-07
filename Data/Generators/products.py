import random
import pandas as pd

from Data.Config.settings import (
    CSV_FOLDER,
    NUM_PRODUCTS,
    CATEGORY_ID_START
)

from Data.Generators.utils import save_csv


def generate_products():

    rows = []

    for i in range(1, NUM_PRODUCTS + 1):

        rows.append({
            "Product_Name": f"Product {i}",
            "Product_Price": round(random.uniform(100, 50000), 2),
            "Category_Id": random.randint(CATEGORY_ID_START, CATEGORY_ID_START + 14)
        })

    df = pd.DataFrame(rows)

    output_file = CSV_FOLDER / "Products.csv"

    save_csv(df, output_file)


if __name__ == "__main__":
    generate_products()