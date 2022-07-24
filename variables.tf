variable "namespace" {
  type    = string
  default = "system"
}

variable "api_url" {
  description = "url of volterra api"
  type        = string
#  default     = ""
}
variable "api_p12_file" {
  description = "Location of volterra p12 file"
  type        = string
#  default     = ""
}
variable "api_ca_cert" {
  description = "public_server_ca.crt file (only required for non-production tenants)"
  type        = string
#  default     = ""
}
variable "api_cert" {
  type        = string
  default     = ""
}
variable "api_key" {
  type        = string
  default     = ""
}
