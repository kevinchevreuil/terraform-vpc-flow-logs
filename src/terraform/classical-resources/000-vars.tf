############################
#####Account variables######
############################
variable "env" {
  description = "specify the environnement"
  type        = string
}

variable "region" {
  description = "Region to use"
  type        = string
  #default = "" (Valeur pas défaut si pas de variable initié)
}

############################
##### Web variables #######
############################
variable "hostname_ec2" {
  description = "Hostname de l'instance EC2 Web Server"
  type        = any
}

############################
#####   Tags values   ######
############################
variable "tags_override" {
  description = "intermediate variable to override tag values"
  type        = map(string)
  default     = {}
}

############################
#####  Locales values ######
############################
locals {
  aws_tags = merge({
    "bank:env"              = var.env
    "bank:country"          = "fr"
    "bank:app_name"         = "web"
    "bank:team"             = "iss"
    "bank:deployment"       = "terraform"
    "bank:runningtimeframe" = "WORKING"
  }, var.tags_override)
}