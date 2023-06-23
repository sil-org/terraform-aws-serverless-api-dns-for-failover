
output "primary_region_domain_name" {
  value = module.primary_region.regional_domain_name
}

output "secondary_region_domain_name" {
  value = module.secondary_region.regional_domain_name
}
