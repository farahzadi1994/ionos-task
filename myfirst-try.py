from dimclient import script_client
client = script_client('http://localhost/dim')
result = client.ippool_list({'include_subnets': True, 'pool': 'reza-ipv6'})
print(result)
delete1= client.ipblock_remove('2001:db8:1:1::/64', {'pool': 'reza-ipv6', 'status': 'Subnet', 'include_messages': True, 'force': True, 'recursive': True, 'dryrun': True})
delete2 = client.ippool_delete('reza-ipv6', {'force': True})
print(delete1)
