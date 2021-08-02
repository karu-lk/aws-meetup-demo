docker build -t aws-demo:latest .

docker run -d -p 8081:80 aws-demo:latest

aws ecr create-repository --repository-name aws-demo-repository

docker tag 1f3a5a76f5e5 626870706694.dkr.ecr.ap-southeast-2.amazonaws.com/aws-demo-repository

login: aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 626870706694.dkr.ecr.ap-southeast-2.amazonaws.com

docker push 626870706694.dkr.ecr.ap-southeast-2.amazonaws.com/aws-demo-repository

aws ecs register-task-definition --cli-input-json file://task-definition.json