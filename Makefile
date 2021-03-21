ifeq ($(OS),Windows_NT)
		SHELL := pwsh.exe
	else
		SHELL := pwsh
	endif
	
	.SHELLFLAGS := -NoProfile -Command

FLATCAR_SERVICES := flatcar_fileserver_beta flatcar_fileserver_alpha flatcar_fileserver_stable flatcar_mirror
ALL_SERVICES :=${FLATCAR_SERVICES}

COMPOSE_FLATCAR_FILES := -f docker-compose.flatcar.yml
COMPOSE_ALL_FILES := ${COMPOSE_FLATCAR_FILES}

all: clean mirror_flatcar

setup:
	@./BuildTools/setup.ps1
mirror_flatcar: setup
	@docker-compose ${COMPOSE_FLATCAR_FILES} up -d --build ${FLATCAR_SERVICES}

clean:
	@docker-compose ${COMPOSE_ALL_FILES} down -v
	
	
	