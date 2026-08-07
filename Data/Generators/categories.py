import pandas as pd

from Data.Config.settings import CSV_FOLDER
from Data.Generators.utils import save_csv


def generate_categories():
    """
    Generate Categories.csv
    """

    categories = [
        "Electronics",
        "Computers",
        "Mobile Phones",
        "Accessories",
        "Gaming",
        "Home Appliances",
        "Kitchen",
        "Furniture",
        "Clothing",
        "Footwear",
        "Beauty",
        "Health",
        "Sports",
        "Books",
        "Toys"
    ]

    df = pd.DataFrame({
        "Category_Name": categories
    })

    output_file = CSV_FOLDER / "Categories.csv"

    save_csv(df, output_file)


if __name__ == "__main__":
    generate_categories()