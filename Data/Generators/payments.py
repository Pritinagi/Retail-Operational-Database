import random
import pandas as pd
from faker import Faker

from Data.Config.settings import (
    CSV_FOLDER,
    NUM_PAYMENTS,
    ORDER_ID_START
)

from Data.Generators.utils import save_csv


fake = Faker()


def generate_payments():

    payment_methods = [
        "Credit Card",
        "Debit Card",
        "UPI",
        "Cash",
        "Net Banking"
    ]

    payments = []

    for _ in range(NUM_PAYMENTS):

        payments.append(
            {
                "Order_Id": random.randint(
                    ORDER_ID_START,
                    ORDER_ID_START + 4999
                ),

                "Payment_Date": fake.date_time_between(
                    start_date="-2y",
                    end_date="now"
                ),

                "Payment_Method": random.choice(
                    payment_methods
                )
            }
        )


    df = pd.DataFrame(payments)

    output_file = CSV_FOLDER / "Payments.csv"

    save_csv(df, output_file)


if __name__ == "__main__":
    generate_payments()