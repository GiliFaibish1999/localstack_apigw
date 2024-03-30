#!/usr/bin/env bash -x

# goes to location
cd /terraform-manifests

# Delete the previous project files and id 
echo -n "" > myid.txt
echo -n "" > temp_url.txt
echo -n "http://localhost:4566/restapis/" > myid.txt

# Start new terraform project 
ls -l
echo "### Starting TerraForm process ###"
echo "starting TF init"
terraform init
echo "finished TF init"
echo "starting TF plan"
terraform plan
echo "finished TF plan"
echo "starting TF apply"
terraform apply -auto-approve
echo "finished TF apply"
echo "### Finished TerraForm process ###"

# Sets the new id -raw
terraform output -raw apigw_id >> myid.txt
echo -n "/dev/_user_request_" >> myid.txt
echo "print myid.txt : "
cat myid.txt

# tests requests url's
# Gets new id from file to variable
# base url definition 
file1=`cat myid.txt`
echo -n $file1 > temp_url.txt
echo -n "/comovai" >> temp_url.txt
echo "print comovai url :"
cat temp_url.txt
echo " "
file2=`cat temp_url.txt`
curl -XGET $file2
echo -n $file1 > temp_url.txt
echo -n "/gilush" >> temp_url.txt
file3=`cat temp_url.txt`
curl -XGET $file3
echo -n $file1 > temp_url.txt
echo -n "/list" >> temp_url.txt
file4=`cat temp_url.txt`
curl -XGET $file4
echo -n $file1 > temp_url.txt
echo -n "/message" >> temp_url.txt
file5=`cat temp_url.txt`
curl -XPOST $file5 -d '{"foo": "bar"}'
