# string functions examples upper and lower , trim, replace, split, join, length, substring, contains, startswith, endswith
# number functions examples abs, ceil, floor, log, max, min, pow, round, sqrt
# lookup functions examples lookup, element, index, keys, values, zipmap
# collection functions examples alltrue, anytrue, chunklist, compact, concat, distinct, flatten, length, list, map, merge, reverse, setintersection, setproduct, setsubtract, setsymmetricdifference, setunion, slice
# time functions examples formatdate, timeadd, timestamp, timeoffset, timecompare
# conversion functions examples tostring, tonumber, tolist, tomap, toset
# file functions examples file, filebase64, filemd5, filesha1, filesha256, filesha512

## Examples for main.tf

#These are the main Terraform function categories mentioned in your file, with simple examples you can use directly.

#```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  app_name     = "DevOps-App"
  env          = "dev"
  names        = ["app", "db", "cache"]
  instance_map = {
    app = "ami-12345678"
    db  = "ami-87654321"
  }

  tags = {
    Name      = "demo-app"
    Env       = "dev"
    Owner     = "team-a"
    ManagedBy = "terraform"
  }
}

# -------------------------
# 1) STRING FUNCTIONS
# -------------------------
output "string_examples" {
  value = {
    upper    = upper(local.app_name)
    lower    = lower(local.app_name)
    trim     = trim("   hello world   ", " ")
    replace  = replace(local.app_name, "-", " ")
    split    = split("-", local.app_name)
    join     = join("-", ["dev", "ops", "app"])
    length   = length(local.app_name)
    contains = contains(local.names, "db")
    starts   = startswith(local.app_name, "Dev")
    ends     = endswith(local.app_name, "App")
  }
}

# -------------------------
# 2) NUMBER FUNCTIONS
# -------------------------
output "number_examples" {
  value = {
    abs   = abs(-15)
    ceil  = ceil(4.2)
    floor = floor(4.9)
    max   = max(10, 25, 5)
    min   = min(10, 25, 5)
    pow   = pow(3, 2)
    sqrt  = sqrt(81)
  }
}

# -------------------------
# 3) LOOKUP FUNCTIONS
# -------------------------
output "lookup_examples" {
  value = {
    lookup = lookup(local.instance_map, "app", "default-ami")
    keys   = keys(local.instance_map)
    values = values(local.instance_map)
    index  = index(local.names, "db")
    element = element(local.names, 1)
  }
}

# -------------------------
# 4) COLLECTION FUNCTIONS
# -------------------------
output "collection_examples" {
  value = {
    concat    = concat(["a", "b"], ["c", "d"])
    distinct  = distinct(["a", "b", "a", "c"])
    flatten   = flatten([["a", "b"], ["c"]])
    slice     = slice(["one", "two", "three", "four"], 1, 3)
    merge     = merge(local.tags, { Tier = "web" })
    setunion  = setunion(["a", "b"], ["b", "c"])
    alltrue   = alltrue([true, true, false])
    anytrue   = anytrue([false, true, false])
    compact   = compact(["a", "", "b", ""])
    reverse   = reverse(["one", "two", "three"])
  }
}

# -------------------------
# 5) TIME FUNCTIONS
# -------------------------
output "time_examples" {
  value = {
    now      = timestamp()
    later    = timeadd(timestamp(), "24h")
    formatted = formatdate("YYYY-MM-DD", timestamp())
  }
}

# -------------------------
# 6) CONVERSION FUNCTIONS
# -------------------------
output "conversion_examples" {
  value = {
    to_string = tostring(123)
    to_number = tonumber("45")
    to_list   = tolist(["x", "y", "z"])
    to_map    = tomap({ env = "dev", team = "platform" })
    to_set    = toset(["a", "b", "a"])
  }
}

# -------------------------
# 7) FILE FUNCTIONS
# -------------------------
# Create a file named sample.txt in the same folder before using this
output "file_examples" {
  value = {
    file_content = file("${path.module}/sample.txt")
    file_base64  = filebase64("${path.module}/sample.txt")
    sha256       = filesha256("${path.module}/sample.txt")
  }
}

# Example explanation
# upper, lower, replace are string functions
# max, min, pow, sqrt are number functions
# lookup, keys, values work with maps
# concat, distinct, flatten, merge are collection functions
# timestamp, timeadd, formatdate are time functions
# tostring, tonumber, tomap, toset are conversion functions
# file, filebase64, filesha256 read files
# If you want, I can also turn this into a smaller version specifically for your class notes or make it look exactly like the examples your trainer expects.