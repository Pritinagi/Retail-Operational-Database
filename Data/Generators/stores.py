import pandas as pd

from Data.Config.settings import CSV_FOLDER
from Data.Generators.utils import save_csv


def generate_stores():

    stores = [
        ("Reliance Digital - Delhi", "Delhi"),
        ("Reliance Digital - Mumbai", "Mumbai"),
        ("Reliance Digital - Bangalore", "Bangalore"),
        ("Reliance Digital - Chennai", "Chennai"),
        ("Reliance Digital - Hyderabad", "Hyderabad"),
        ("Reliance Digital - Kolkata", "Kolkata"),
        ("Reliance Digital - Pune", "Pune"),
        ("Reliance Digital - Jaipur", "Jaipur"),
        ("Reliance Digital - Chandigarh", "Chandigarh"),
        ("Reliance Digital - Lucknow", "Lucknow")
    ]

    df = pd.DataFrame(
        stores,
        columns=[
            "Store_Name",
            "Store_City"
        ]
    )

    output_file = CSV_FOLDER / "Stores.csv"

    save_csv(df, output_file)


if __name__ == "__main__":
    generate_stores()