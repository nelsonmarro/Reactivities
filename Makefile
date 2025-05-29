
# Variables (optional, can be customized)
API_PROJECT_NAME = API
API_PROJECT_FILE ?= $(API_PROJECT_NAME)/$(API_PROJECT_NAME).csproj

# Default target: executed when you just type 'make'
default: run

# Phony targets: these are not actual files
.PHONY: run watch clean restore build publish

# Target to run the application
# Usage: make run
# Usage with specific project: make run PROJECT=MySpecificProject/MySpecificProject.csproj
run:
	@echo "Running $(API_PROJECT_NAME)..."
	dotnet run --project $(API_PROJECT_FILE)

# Target to run the application with hot reload
# Usage: make watch
# Usage with specific project: make watch PROJECT=MySpecificProject/MySpecificProject.csproj
watch:
	@echo "Watching $(API_PROJECT_NAME) for changes..."
	dotnet watch run --project $(API_PROJECT_FILE)

# Target to clean the project
# Usage: make clean
clean:
	@echo "Cleaning project..."
	dotnet clean $(API_PROJECT_FILE)
	@echo "Cleaning complete."

# Target to restore dependencies
# Usage: make restore
restore:
	@echo "Restoring dependencies..."
	dotnet restore $(API_PROJECT_FILE)
	@echo "Restore complete."

# Target to build the project
# Usage: make build
build:
	@echo "Building project..."
	dotnet build $(API_PROJECT_FILE)
	@echo "Build complete."

# Target to publish the project
# Usage: make publish
# Usage with specific configuration: make publish CONFIG=Release
CONFIG ?= Debug # Default configuration
OUTPUT_DIR ?= ./bin/publish
publish:
	@echo "Publishing project in $(CONFIG) mode to $(OUTPUT_DIR)..."
	dotnet publish $(API_PROJECT_FILE) -c $(CONFIG) -o $(OUTPUT_DIR)
	@echo "Publish complete."

helpAPI_:
	@echo "Available targets:"
	@echo "  run        : Runs the application using 'dotnet run'."
	@echo "  watch      : Runs the application with 'dotnet watch' for hot reload."
	@echo "  clean      : Cleans the project build outputs."
	@echo "  restore    : Restores NuGet packages."
	@echo "  build      : Builds the project."
	@echo "  publish    : Publishes the project (default: Debug config to ./bin/publish)."
	@echo "               Use 'make publish CONFIG=Release OUTPUT_DIR=./my-release' for custom publish."
	@echo "  help       : Shows this help message."
	@echo ""
	@echo "You can specify the project file using the PROJECT variable:"
	@echo "  make run PROJECT=path/to/your.csproj"
	@echo "By default, it assumes a project in a subdirectory with the name 'YourApiProject' or current directory."
	@echo "Please update the API_PROJECT_NAME variable at the top of the Makefile to match your project's name."

