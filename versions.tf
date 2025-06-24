terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.67.1"
    }    
    restapi = {
      source = "Mastercard/restapi"
      #version = "1.20.0"
    }
  }
}
