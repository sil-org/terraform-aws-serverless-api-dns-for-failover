
output "primary_region_domain_name" {
  value = module.fail_over_cname.primary_region_domain_name
}

output "primary_region_summary" {
  value = module.fail_over_cname.primary_region_summary
}

output "secondary_region_domain_name" {
  value = module.fail_over_cname.primary_region_domain_name
}

output "secondary_region_summary" {
  value = module.fail_over_cname.secondary_region_summary
}
