$TTL 1D
@	         IN   SOA	ns.metropolis-general.com mgmtadmin.metropolis-general.com (
					 3	; serial
					 1D	; refresh
					 1H	; retry
					 1W	; expire
					 3H )	; minimum
@			     IN	  NS	ns.metropolis-general.com.

@			     IN	MX	10	mail.metropolis-general.com.

ns		     IN	A	10.0.0.1
mail		   IN	A	10.0.0.2
www		     IN	A	10.0.0.3
heartbeat	 IN	A	10.0.0.4
fs	       IN	A	10.0.0.5
mutillidae IN A 10.0.0.6
