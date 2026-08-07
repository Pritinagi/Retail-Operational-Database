import pandas as pd


def save_csv(dataframe, output_path):
    """
    Save a pandas DataFrame as CSV.
    """

    dataframe.to_csv(
        output_path,
        index=False
    )

    print(f"✓ Generated {output_path}")