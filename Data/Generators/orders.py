import random
import pandas as pd
from faker import Faker

from Data.Config.settings import (
    CSV_FOLDER,
    NUM_ORDERS,
    CUSTOMER_ID_START,
    EMPLOYEE_ID_START
)

from Data.Generators.utils import save_csv


fake = Faker()


def generate_orders():

    orders = []

    for _ in range(NUM_ORDERS):

        orders.append(
            {
                "Customer_Id": random.randint(
                    CUSTOMER_ID_START,
                    CUSTOMER_ID_START + 999
                ),

                "Employee_Id": random.randint(
                    EMPLOYEE_ID_START,
                    EMPLOYEE_ID_START + 49
                ),

                "Order_Date": fake.date_time_between(
                    start_date="-2y",
                    end_date="now"
                ),

                "Total_Amount": round(
                    random.uniform(500, 100000),
                    2
                )
            }
        )


    df = pd.DataFrame(orders)

    output_file = CSV_FOLDER / "Orders.csv"

    save_csv(df, output_file)


if __name__ == "__main__":
    generate_orders()