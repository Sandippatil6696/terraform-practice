locals {
    env = {
        dev={
            instance_count = 2
            s3_bucket_count = 1
            dynadb_tbl_count = 1
        }

        stg={
            instance_count= 3
            s3_bucket_count = 1
            dynadb_tbl_count = 1
            
        }

        prod={
            instance_count = 4
            s3_bucket_count = 1
            dynadb_tbl_count = 1
        }
   }
  current_env = lookup(local.env , terraform.workspace , local.env["dev"])
    
}


module "ec2" {
  source = "./modules/ec2"
  env = terraform.workspace
  ec2_instance_count = local.current_env.instance_count
}


module "s3" {
  source = "./modules/s3"
  env = terraform.workspace
  s3_bucket_count = local.current_env.s3_bucket_count
 
  
}

module "dynamodb" {
  source = "./modules/dynamodb"
  env = terraform.workspace
  dynamodb_table_count = local.current_env.dynadb_tbl_count
}