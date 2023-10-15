

resource "kubernetes_secret" "docker-registry-credentials" {
  metadata {
    name = "docker-registry-credentials"
    annotations = {
      "reflector.v1.k8s.emberstack.com/reflection-allowed"      = true
      "reflector.v1.k8s.emberstack.com/reflection-auto-enabled" = true
    }
  }

  data = {
    ".dockerconfigjson" = file(".dockerconfig.json")
  }

  type = "kubernetes.io/dockerconfigjson"

  depends_on = [ argocd_application.reflector ]
}


resource "kubernetes_secret" "env-secret" {
  metadata {
    name = "env-secret"
    annotations = {
      "reflector.v1.k8s.emberstack.com/reflection-allowed"      = true
      "reflector.v1.k8s.emberstack.com/reflection-auto-enabled" = true
    }
  }

  type = "Opaque"

  data = {
    ".env" = file(".env")
  }
  depends_on = [ argocd_application.reflector ]
}
