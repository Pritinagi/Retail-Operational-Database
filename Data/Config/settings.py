from pathlib import Path

# -----------------------------
# Project Paths
# -----------------------------

PROJECT_ROOT = Path(__file__).resolve().parents[2]

DATA_FOLDER = PROJECT_ROOT / "Data"
CSV_FOLDER = DATA_FOLDER / "CSV"

# Create CSV folder automatically if it doesn't exist
CSV_FOLDER.mkdir(parents=True, exist_ok=True)

# -----------------------------
# Dataset Size
# -----------------------------

NUM_CATEGORIES = 15
NUM_PRODUCTS = 100
NUM_STORES = 10
NUM_EMPLOYEES = 50
NUM_CUSTOMERS = 1000
NUM_ORDERS = 5000
NUM_ORDER_ITEMS = 15000
NUM_PAYMENTS = 5000

# -----------------------------
# SQL Server Identity Values
# -----------------------------

CATEGORY_ID_START = 101
PRODUCT_ID_START = 201
STORE_ID_START = 301
EMPLOYEE_ID_START = 401
CUSTOMER_ID_START = 501
ORDER_ID_START = 1001
ORDER_ITEM_ID_START = 2001
INVENTORY_ID_START = 3001
PAYMENT_ID_START = 4001