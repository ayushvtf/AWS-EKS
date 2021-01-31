cluster_name            = "org-eks"
iac_environment_tag     = "development"
name_prefix             = "org"
main_network_block      = "10.0.0.0/16"
subnet_prefix_extension = 4
zone_offset             = 8


admin_users                              = ["admin"]
developer_users                          = ["dev"]
asg_instance_types                       = ["t2.small", "t2.micro"]
autoscaling_minimum_size_by_az           = 1
autoscaling_maximum_size_by_az           = 2
autoscaling_average_cpu                  = 80


dns_base_domain               = "org.in"
ingress_gateway_chart_name    = "nginx-ingress"
ingress_gateway_chart_repo    = "https://helm.nginx.com/stable"
ingress_gateway_chart_version = "0.5.2"
ingress_gateway_annotations = {
  "controller.service.httpPort.targetPort"                                                                    = "http",
  "controller.service.httpsPort.targetPort"                                                                   = "http",
  "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-backend-protocol"        = "http",
  "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-ssl-ports"               = "https",
  "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-connection-idle-timeout" = "60",
  "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"                    = "elb"
}

deployments_subdomains = ["sample", "api"] 
# to be prefixed before dns_base_domain (e.g. sample.syezy.in or api.syezy.in),
# and handled by Ingress rules defined by each Application Helm Chart

namespaces = ["org"]
