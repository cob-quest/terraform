resource "argocd_repository" "private" {
  for_each        = { for repo in var.repo_list : repo.name => repo }
  repo            = each.value.repo
  name            = each.key
  ssh_private_key = file("argocd.key")
  insecure        = false
}