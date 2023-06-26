variable "name" {
  type = string
}

variable "description" {
  type = string
  default = null
}

variable "network_id" {
  type = string
}

variable "ingress_rules" {
  type = list
  default = []
}

variable "egress_rules" {
  type = list
  default = []
}