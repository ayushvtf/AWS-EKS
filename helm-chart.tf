

resource "helm_release" "consul" {
  name      = "test"
  chart     = "${path.module}/app/helm"
  namespace = "default"
  
  values = [
    "${file("${path.module}/app/helm/values.yaml")}"
  ]

#   set {
#     name  = "server.replicas"
#     value = var.replicas
#   }

#   set {
#     name  = "server.bootstrapExpect"
#     value = var.replicas
#   }

  set {
    name  = "ingress.host"
    value = "api.stezy.in"
  }

#   provisioner "local-exec" {
#     command = "helm test ${var.name}"
#   }
}




# resource "helm_release" "ingress" {
#   name       = "ingress"
#   chart      = "aws-alb-ingress-controller"
#   repository = "http://storage.googleapis.com/kubernetes-charts-incubator"
#   version    = "1.0.2"

#   set {
#     name  = "autoDiscoverAwsRegion"
#     value = "true"
#   }
#   set {
#     name  = "autoDiscoverAwsVpcID"
#     value = "true"
#   }
#   set {
#     name  = "clusterName"
#     value = local.cluster_name
#   }
# }