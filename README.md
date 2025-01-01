Hello Team,

My name is Vishal Mehetre.You provided the assignment as per your requirement for Cloud Engineer position at Equip9 Pvt. Ltd.
************************************************************************************************************************************************************************************************************************
Task Details :-

Part 1: HTTP Service 

Develop an HTTP service in any programming language of your choice. The service should 
expose the following endpoint: 
Endpoint: GET http://IP:PORT/list-bucket-content/<path> 

● Functionality: 

○ This endpoint returns the content of an S3 bucket for the specified path. 

○ If no path is specified, the top-level content of the bucket is returned. 

○ The response should be in JSON format. 

Part 2: Terraform Deployment 

Write a Terraform layout to provision AWS infrastructure and deploy the HTTP service 
created in Part 1. 

● The Terraform code should: 

1. Create and configure the necessary AWS resources.
   
3. Deploy the service to AWS (e.g., using EC2, ECS, Lambda, or any other 
appropriate AWS service).

************************************************************************************************************************************************************************************************************************

 *Here the steps I used to accomplish this Task*

 steps :

1. First create AWS account.
2. Create IAM User and permission or group policies which required for EC2 and S3 Bucket.
3. After that generate Access key and Secret Access key of this IAM user.
4. After that download AWS CLI and Terraform extension.
5. Setup AWS CLI and Terraform.
6. After that provide AWS Authentication on your local Machine by using CMD.
7. After environment completly setup moving toward assignment 1st task.
8. So, open code editor like VScode.
9. Create one folder for assignment first Part.
10. In this folder add DATA-FOLDERS which you want to upload in S3 Bucket.
11. Now for S3 Bucket create terraform files .tf (provider.tf, main.tf, var.tf, terraform.tfvars ).
12. In provider.tf file write terraform code to configure cloud provider like AWS.
13. After that in var.tf file define all variable and in terraform.tfvars declare the value of this variables.
14. Now, in main.tf file write terraform code to create S3 Bucket which contain DATA-FOLDERS.
15. In this Main.tf file use for-each loop to uplaod DATA-FOLDERS.

      ![Screenshot 2025-01-01 052831](https://github.com/user-attachments/assets/e4a6e262-6b88-42f4-b030-5bf7808be4cf)


16. Now, after completing this steps push Terraform commands to create S3 Bucket.

    Commands :
    
    1) terraform init  (this is command initializes a working directory and downloads the necessary plugins.)
    2) terraform validate ( this command check the resources code is correct or not.)
    4) terraform plan ( this commands creates an execution plan, and provide blueprint.)
    5) terraform apply --auto-approve ( this command is used to deploy your infrastructure.)
   
17. After terraform apply command it will give you output like this

    ![s3-terraform](https://github.com/user-attachments/assets/42cb04e2-c9d3-4eb8-b066-7d4eae0a7552)



    ![s3-creation](https://github.com/user-attachments/assets/e6a2ad92-a62e-4c12-90eb-998b29532411)



    ![Screenshot 2025-01-01 060639](https://github.com/user-attachments/assets/0997aaab-cb20-4077-9955-50cee97ad8e4)




19. Now to call and retrieve data form s3 bucket used following steps :
20. create python file app.py.
21. befor that install python related packages like (Boto3, flask, jsionify, dotenv)
22. for this use command ( pip install package-name ).
23. after that write python code. In this file app.py import all packages like (Boto3, flask, jsionify, dotenv).
24. after that define and configure S3 bucket details like Bucket-name, Access-key, Secrete-Access-key, region.).
25. After that write a python function to call GET method which display or return S3 bucket data in jsion format.
26. After that, At the end of this file define the PORT in which you wan to run your application app.py .


     ![Screenshot 2025-01-01 055648](https://github.com/user-attachments/assets/9e2023a6-6d60-4c56-8a2a-daa2bc1a2c38)



27. After that run app.py file it provides you api to retrieve data using port .


    ![Screenshot 2025-01-01 060849](https://github.com/user-attachments/assets/e7af821a-6ac7-484b-9ad3-567467c5f10f)



28. After that used curl command to get data on terminal. ( curl http://192.168.170.151:8000/list-bucket-content )


    ![Screenshot 2025-01-01 061640](https://github.com/user-attachments/assets/a35dad27-5264-4972-8ec6-02ae1a1bc05e)


29. After run this API on browser it will provide you output in jsion format.
    

    ![Screenshot 2025-01-01 062048](https://github.com/user-attachments/assets/9cda627e-d1e2-4eb6-839b-d7bfc6cd650b)
    

31. if you want to explore bucket content again edit this api and run on browser.
    

    ![Screenshot 2025-01-01 062516](https://github.com/user-attachments/assets/a603605f-5e95-45ef-b773-f4c7220c7e43)


    ![Screenshot 2025-01-01 062353](https://github.com/user-attachments/assets/639ae385-f2e6-4539-a858-54d1327786e2)



*********************************************************************************************************************************************************************************************************************************************



*video representation of this 1st Task*


https://drive.google.com/file/d/1HHro4qdsLpjsyx-zV9TO4ltsZTgtIWhy/view?usp=sharing




*********************************************************************************************************************************************************************************************************************************************


32. Now its time to complete 2nd task.
33. for this task create folder (2nd-Task).
34. In this folder add app.py file which you was created in first task.
35. now first open git bash and generate ssh public key (developer-key) cy using ssh-keygen command.


    ![Screenshot 2025-01-01 063551](https://github.com/user-attachments/assets/43cb0556-1121-4426-a75e-a8610f94c484)



36. after that copy developer-key and developer-key.pub and in 2nd-Task folder.
37. after that for aws configuration create .env file in this file define Access and Secret key.
38. after that create files like ec2_userdata.sh, main.tf, and variable.tf.
39. So, in variables.tf file define all variables.
40. after that in main.tf file create security group in this open 8000 port on both inbound and outbound rule.
41. after that write a terraform code to create ec2 instance in this provide path of file ec2_userdata.sh for user_data keyword which you was declare in aws_instance.
42. after that in ec2_userdata.sh file  write all linux command and shell script for installing packages in ec2-instance like python3, boto3, flask, etc.
43. after successfully written terraform and python code . run the terraform commands to deploy virtual machine.
44. terraform command already mentioned in first task copy it.
45. when successfully deploying VM it gives you public ip address.


    ![ec2-terraform-code](https://github.com/user-attachments/assets/cc110f1e-ade0-4e0c-bdd5-ff4da637542e)




    ![HTTP-server](https://github.com/user-attachments/assets/2bddb17b-2653-4120-bd8d-29bb2e8c162b)


46. after that copy this ip address and paste it with application port number on browser.(13.60.84.215:8000).
47. after that it will return similar output of first task in jsion format.

    ![Ec2-ip-output](https://github.com/user-attachments/assets/8410eab3-dd03-4802-9d22-5276bcdc055e)





*********************************************************************************************************************************************************************************************************************************************
******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


*video representation of 2nd this Task*


https://drive.google.com/file/d/15hJTiKP4YyVKtUxoJb8dAKT6bN6XEWxq/view?usp=sharing




*********************************************************************************************************************************************************************************************************************************************

*so task was successfully completed.*

*Thanks.....*

    
 














    


 
 ***********************************************************************************************************************************************************************************************************************






