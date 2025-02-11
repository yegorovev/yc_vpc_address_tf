variable "name" {
  description = "Name of the address"
  type        = string
  nullable    = false
}

variable "external_ipv4_address" {
  description = "Address"
  type        = object({
    zone_id = string
  })
  nullable    = true
  default     = null
}