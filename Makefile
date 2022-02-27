build:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build ${LDFLAGS} -o main ./main.go
docker_image:
	docker build -f Dockerfile --tag db1000n:latest .
init:
	terraform init
start:
	terraform plan -out=db1000n.out && terraform apply "db1000n.out"
destroy:
	terraform apply "db1000n.out"
