from dimclient import script_client

# Ask user for the pool name
pool = input("Enter pool name: ")

# Connect to DIM
client = script_client('http://localhost/dim')

# Get pool info
data = client.ippool_list({'include_subnets': True, 'pool': pool})
print("Pool info:", data)

# Get subnets from pool
subs = data[0]['subnets']

# Remove subnets
for s in subs:
    print("Removing subnet", s)
    client.ipblock_remove(s, {
        'pool': pool,
        'status': 'Subnet',
        'include_messages': True,
        'force': True,
        'recursive': True,
        'dryrun': False
    })

# Delete the pool
print("Deleting pool", pool)
client.ippool_delete(pool, {'force': True})
print("Done")
