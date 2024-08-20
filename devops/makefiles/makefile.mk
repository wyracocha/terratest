build_image: 
	@./devops/scripts/docker.sh script_docker_build
push_image:
	@./devops/scripts/docker.sh script_docker_push