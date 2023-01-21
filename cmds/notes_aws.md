-   How to install aws cli?

    -   `$ pip install awscli`

-   Configure the AWS CLI: Once you have your access keys you can configure the AWS CLI. Open a shell and use this command:

    -   `$ aws configure`
    -   Follow the prompts and enter in your keys and the region you are working in. You can see a list of regions and region codes here: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions
        -   AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
        -   AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
        -   Default region name [None]: us-east-1
        -   Default output format [None]: ENTER
    -   You should now be ready to go with the AWS CLI

-   `$ aws lambda delete-function --function-name <lambda_function_name>`
-   `$ aws iam delete-role --role-name <your_role_name>`
