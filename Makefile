build:
	docker build -t localhost:5000/ccnmtl/postfix .
push:
	docker push localhost:5000/ccnmtl/postfix