variable "resource_group_name" {
  type        = string
  description = "The name of the backend storage account resource group"
  default     = "cc-server-infra"
}


variable "ssh-key" {
  type = string
  description = "The public ssh-key"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAgxGsHlEvUHpzYX5dmZxe9YTxx4uIiaYNFe8IkBVnRbgwiNwJEyB4n5kUVIjB2ezxHTRsc7ieu0x6xyV8uh0EJQCB9TtwhCI3hPouGfjEKui66ZMMU8+Mmx34q/excmXOwC2RCgD7LiRBImCvZ3zpmzuctKRTroH5GJxpRTvEQ/AX4FuoFfy3UI4mfo+7VQ8wSO/DfkP6+uCoSIKtDFUhaLrjdZrrNvs6A85Oe2JzTc/aLUfl7dIQItvyFFFBIHyEezKchnB8mlnFzDKXdCTzDUkFjGPsXtzU3yulTC2BKqkgWtWO7o2xE5p/YT7jQNPel36AN1jJ7hTpigUct7s8WV3EnNstPSP6XI5dpvfO2wxiWdHtPxtL6qNqxjC14d5RmT5i5lz20I/10Y1dhic+pQhEA9zGWhidibnclQHf4nhMNtsN+qfUtt7eYBhWnfSCXlA9ymYR6RSkNdOH2jpMejEx4fbPTLWOi9l07P6GaJLrDWfBcZ4kmPNHxp91q6quYbqgLzvl1jV6m1PGPv32FXSyzA5hA2XMXI+kJcUXuqJ74HqnsFgIgStq8LTxBbmWwJCusv1M1GBdx1VUjXYda7+OA8O8ePQGQ5cWsfpHEp4YTXJWLECskiPqHQk+ghJPNOBRno+4uiKfIVfvuRvqDGfVnzd1S2Hu+cO11KxdHFs= ***@gmail.com rsa-key-20201028"
}


variable "location" {
  type = string
  description = "Location "
  default = "West Europe"
}
