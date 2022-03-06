from nameko.standalone.rpc import ClusterRpcProxy

AMQP_URI = "pyamqp://guest:guest@rabbit"

config = {
    'AMQP_URI': AMQP_URI
}

with ClusterRpcProxy(config) as cluster_rpc:
    print(cluster_rpc.greeting_service.hello(name='Patrick Felipe'))