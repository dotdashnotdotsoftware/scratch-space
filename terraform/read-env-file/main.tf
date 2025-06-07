variable env_path {
  type        = string
  description = "path to .env file"
}


data "external" "env_vars" {
  program = ["bash", "-c", "cat ${var.env_path} | awk -F '=' '!/^#/ && NF==2 {values = values sprintf(\"\\\"%s\\\":\\\"%s\\\",\", $1, $2)} END {print \"{\" substr(values, 1, length(values)-1) \"}\"}'"]
}

output "env_object" {
   value = data.external.env_vars.result
}