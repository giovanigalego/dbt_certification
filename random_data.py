import json
import random
from faker import Faker  # Install using 'pip install Faker'
from datetime import datetime, timedelta
from time import sleep
import snowflake.connector  # Install using 'pip install snowflake-connector-python'

# Snowflake connection details (replace with your actual credentials)
snowflake_account = "zjb57289.us-east-1"
user = "GIOVANIGALEGO"
password = "Giov@ni96@Snow"
database = "GG_DBT_RAW"
schema = "DATASET"
table = "EVENT_DATA"
fake = Faker()  # Initialize Faker for realistic data

def generate_random_json_data(num_items=1):
    """Generates a list of dictionaries containing random JSON data."""

    data = []
    for _ in range(num_items):
        item = {
            "name": fake.name(),
            "phone_number": fake.phone_number(),
            "age": random.randint(18, 80),
            "is_active": random.choice([True, False]),
            "random_number": random.uniform(0, 100),
            "datetime": (datetime.now() - timedelta(days=random.randint(0, 365))).strftime("%Y-%m-%d %H:%M:%S.%f")
            # Add more fields as needed
        }
        data.append(item)

    return data

# Customize the number of items and output file path
# num_items = 10  # Adjust as needed

data = generate_random_json_data()
print(json.dumps(data))

ctx = snowflake.connector.connect(
    account=snowflake_account,
    user=user,
    password=password,
    database=database,
    schema=schema
)

cs = ctx.cursor()

iterator = 10

for i in range(iterator):
    data = generate_random_json_data()
    
    for item in data:
        cs.execute("insert into demo_data (select PARSE_JSON('%s'))" % json.dumps(data))
    sleep(1)

ctx.close()
cs.close()


# cs = ctx.cursor()
# try:
#     for item in data:
#         cs.execute("insert into demo_data (select PARSE_JSON('%s'))" % json.dumps(data))
# finally:
#     cs.close()
# ctx.close()