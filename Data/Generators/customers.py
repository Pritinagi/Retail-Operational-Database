import pandas as pd
from faker import Faker

from Data.Config.settings import (
    CSV_FOLDER,
    NUM_CUSTOMERS
)

from Data.Generators.utils import save_csv


fake = Faker("en_IN")


def generate_customers():

    customers = []

    emails = set()
    phones = set()

    while len(customers) < NUM_CUSTOMERS:

        name = fake.name()

        email = fake.email()

        phone = fake.phone_number()

        # Remove unwanted characters from phone numbers
        phone = ''.join(filter(str.isdigit, phone))[:10]

        # Ensure uniqueness because database has UNIQUE constraints
        if email in emails or phone in phones:
            continue

        emails.add(email)
        phones.add(phone)

        customers.append(
            {
                "Customer_Name": name,
                "Customer_Email": email,
                "Customer_Phone": phone
            }
        )

    df = pd.DataFrame(customers)

    output_file = CSV_FOLDER / "Customers.csv"

    save_csv(df, output_file)


if __name__ == "__main__":
    generate_customers()