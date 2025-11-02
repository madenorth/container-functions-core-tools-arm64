# Azure Functions C# Development Container

This project provides a development container for running and debugging Azure Functions locally using C#. It is designed to streamline the development process by providing a consistent environment that includes all necessary tools and dependencies.

## Project Structure

The project is organized as follows:

```
azure-functions-csharp-devcontainer
├── .devcontainer
│   ├── devcontainer.json      # Configuration for the development container
│   └── Dockerfile             # Dockerfile for building the development container
├── src
│   └── MyFunctionApp
│       ├── MyFunctionApp.csproj # Project file for the Azure Functions application
│       ├── Function1.cs         # Implementation of the Azure Function
│       ├── host.json            # Global configuration for the Azure Functions host
│       └── local.settings.json   # Local configuration settings (not in source control)
├── .vscode
│   ├── launch.json              # Debugging configuration for the Azure Functions app
│   └── tasks.json               # Task definitions for the development environment
├── .gitignore                    # Git ignore file for excluding unnecessary files
├── .dockerignore                 # Docker ignore file for excluding unnecessary files
└── README.md                     # Project documentation
```

## Getting Started

To get started with this project, follow these steps:

1. **Clone the Repository**: Clone this repository to your local machine.
2. **Open in VS Code**: Open the project folder in Visual Studio Code.
3. **Reopen in Container**: Use the command palette (Ctrl+Shift+P) and select "Remote-Containers: Reopen in Container" to build and start the development container.
4. **Run the Function**: Once the container is running, you can start debugging or running your Azure Functions locally.

## Development

- The development container is configured to include all necessary tools for Azure Functions development.
- You can modify the `Function1.cs` file to implement your Azure Function logic.
- Use the `.vscode/tasks.json` file to define custom tasks for building and testing your application.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.