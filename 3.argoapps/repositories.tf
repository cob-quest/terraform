resource "argocd_repository" "private" {
  for_each        = { for repo in var.repo_list : repo.name => repo }
  repo            = each.value.repo
  name            = each.key
  ssh_private_key = file("argocd.key")
  insecure        = false
  # username = "admin"
  # password = "hOy6de0rTi-iRSeu"
}

# resource "argocd_repository" "test" {
#   repo = "git@gitlab.com:cs302-2023/g3-team8/project/k8s/assignment-charts.git"
# }

# resource "argocd_repository" "replicator" {
#   repo = "https://emberstack.github.io/helm-charts"
#   type = "helm"
  
# }