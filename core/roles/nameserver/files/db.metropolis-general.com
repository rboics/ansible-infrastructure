$TTL 1D
@	IN SOA	ns.metropolis-general.com mgmtadmin.metropolis-general.com (
					3	; serial
					1D	; refresh
					1H	; retry
					1W	; expire
					3H )	; minimum
@			IN	NS	ns.metropolis-general.com.

@			IN	MX	10	mail.metropolis-general.com

ns		IN	A	192.168.204.1
mail		IN	A	192.168.203.204
www		IN	A	192.168.203.208
heartbeat	IN	A	192.168.203.220
fs	IN	A	192.168.203.252
