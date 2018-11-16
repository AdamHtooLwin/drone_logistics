import riak
import datetime
import time

client = riak.RiakClient(pb_port=8087)

# Maybe separate dily logs by bucket

bucket_name = 'logs-{0}'.format(datetime.datetime.now().strftime("%Y-%m-%d"))
logsBucket = client.bucket(bucket_name)

log1 = {
    'altitude': 50,
    'gps_latitude': 14.076768,
    'gps_longitude': 100.614727,
    'datetime': datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
    'order_id': 1
}

print("Flying to next waypoint")
time.sleep(5)

log2 = {
    'altitude': 50,
    'gps_latitude': 14.076868,
    'gps_longitude': 100.613927,
    'datetime': datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
    'order_id': 1
}

print("Flying to next waypoint")
time.sleep(5)

log3 = {
    'altitude': 50,
    'gps_latitude': 14.076768,
    'gps_longitude': 100.613327,
    'datetime': datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
    'order_id': 1
}

# 14.076768, 100.614727
# Orion-2018-05-01 00:00
# Create new bucket on new day


key1 = 'Orion-{0}-{1}'.format(log1['datetime'], 1)
key2 = 'Orion-{0}-{1}'.format(log2['datetime'], 2)
key3 = 'Orion-{0}-{1}'.format(log3['datetime'], 3)

newLog1 = logsBucket.new(key1, data=log1)
newLog1.store()

newLog2 = logsBucket.new(key2, data=log2)
newLog2.store()

newLog3 = logsBucket.new(key3, data=log3)
newLog3.store()


# CODE VAULT
# key = f'Orion-{datetime.datetime.now().isoformat()}'
# key = f'Orion-{datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")}'
# key = "Orion-" + datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

# val1 = 1
# key1 = myBucket.new('one', data=val1)
# key1.store()