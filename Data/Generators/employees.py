import random
import pandas as pd
from faker import Faker

from Data.Config.settings import (
    CSV_FOLDER,
    NUM_EMPLOYEES,
    STORE_ID_START
)

from Data.Generators.utils import save_csv

fake = Faker("en_IN")


def generate_employees():

    roles = [
        "Store Manager",
        "Cashier",
        "Sales Associate",
        "Inventory Executive"
    ]

    rows = []

    for _ in range(NUM_EMPLOYEES):

        rows.append({
            "Employee_Name": fake.name(),
            "Employee_Role": random.choice(roles),
            "Store_Id": random.randint(STORE_ID_START, STORE_ID_START + 9)
        })

    df = pd.DataFrame(rows)

    output_file = CSV_FOLDER / "Employees.csv"

    save_csv(df, output_file)


if __name__ == "__main__":
    generate_employees()