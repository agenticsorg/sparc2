

# SPARC Code Agent + MCP Server
SPARC 2.0, agentic code analysis and generation, is an intelligent coding agent framework built to automate and streamline software development. It combines secure execution environments, version control, and Model Context Protocol (MCP) capabilities into a unified system where specialized agents collaborate to understand, modify, and manage code. 

These agents analyze patterns, suggest improvements, implement changes, and validate solutions, all while maintaining a detailed history that allows for easy rollbacks when needed.
### Install globally
``` npm install -g @agentics.org/sparc2 ```

# SPARC 2.0 (alpha)

By bridging the gap between human developers and AI assistants, SPARC 2.0 enhances productivity across the entire development lifecycle, from initial code review to final deployment.

A defining feature of SPARC is its ability to track code changes over time, functioning like a perfect memory of your code's evolution. It uses a unified diff system to capture precisely what changed between versions rather than storing entire files, dramatically reducing storage needs and speeding up operations. By default, the system tracks changes at the file level for optimal performance, yet it can zoom in to function-level tracking when more granular detail is required. This efficient diff tracking ensures smooth performance whether you are working on a small project or a massive enterprise codebase.

Essentially, SPARC acts as an advanced version control enhancer that integrates with Git and GitHub while leveraging artificial intelligence to manage updates automatically. Its understanding of temporal relationships between code modifications allows it to orchestrate complex workflows that support simultaneous contributions from both human developers and AI agents. SPARC adapts its processing pace to match developers' speed, ensuring seamless, conflict-free collaboration.

At the heart of SPARC lies its vector store, a specialized database that transforms code and text into abstract patterns. Instead of merely memorizing exact words, it captures the underlying meaning of the code, similar to understanding cooking techniques rather than just listing ingredients. This approach enables the system to locate similar code snippets despite differences in variable names or styles, creating a smart library of your development history.

Another key element is its integrated code interpreter built using E2B—a language-agnostic execution environment that builds, runs, and modifies code without relying on a traditional IDE. It creates secure, isolated sandboxes for execution across languages such as Python, JavaScript, TypeScript, Go, Rust, and more. 

SPARC 2.0 employs a ReACT (Reason + Act) strategy to semantically understand code. It first reasons about what the code means and then takes appropriate actions. This combination of efficient diff tracking and intelligent reasoning enables rapid processing of large codebases without sacrificing deep comprehension of the code's purpose and structure.


## Key Benefits

- **Automated Code Analysis**: Identifies bugs, performance issues, and potential improvements in your code
- **Intelligent Code Modifications**: Applies suggested changes with precision, maintaining code style and patterns
- **Secure Code Execution**: Tests code in a sandboxed environment before applying changes
- **Version Control Integration**: Creates checkpoints and enables rollbacks to previous states
- **Vector Search**: Finds similar code changes and patterns across your codebase
- **Flexible Processing Modes**: Supports parallel, sequential, concurrent, and swarm processing
- **Multiple Execution Modes**: Works in automatic, semi-automatic, or manual modes to fit your workflow
- **Configurable**: Extensive configuration options via TOML files and environment variables
- **Cross-Platform**: Works on any platform that supports Deno
- **MCP Integration**: Provides Model Context Protocol (MCP) server for AI agent integration
- **Real-time Updates**: Supports Server-Sent Events (SSE) for streaming real-time progress and results

![SPARC2 Logo](assets/image.png)

## How It Works

At its core, SPARC 2.0 uses advanced diff tracking to compare previous and updated versions of code:

1. **Diff Tracking**: By default, it logs changes on a per-file basis for optimal performance, but you can opt for a per-function approach for more granular detail
2. **AI-Powered Analysis**: Uses OpenAI's models to analyze code and suggest improvements
3. **Sandboxed Execution**: Tests code changes in a secure environment using E2B Code Interpreter
4. **Git Integration**: Creates checkpoints and enables rollbacks to previous states
5. **Vector Database**: Stores and indexes all changes for easy retrieval and analysis

### Processing Modes

SPARC 2.0 supports multiple processing modes:

- **Parallel**: Process multiple code changes simultaneously (ideal for large projects)
- **Sequential**: Process changes one after another in a defined order
- **Concurrent**: Use asynchronous operations to ensure I/O-bound tasks don't block others
- **Swarm**: Coordinate multiple agents to work on different aspects of the same problem

### Execution Modes

- **Automatic**: Autonomously makes and commits code changes
- **Semi-automatic**: Proposes modifications and waits for your approval
- **Manual**: Provides analysis but requires manual implementation
- **Custom**: Define your own workflow with custom steps

## Use Cases

SPARC 2.0 is ideal for:

- **Code Refactoring**: Identify and fix code smells, improve performance, and enhance readability
- **Bug Fixing**: Analyze and fix bugs with automated testing
- **Code Reviews**: Get AI-powered insights on code quality and potential issues
- **Learning**: Understand how to improve your code with detailed explanations
- **Technical Debt Reduction**: Systematically identify and address technical debt
- **Codebase Exploration**: Use vector search to find similar patterns across your codebase
- **AI Agent Integration**: Use the MCP server to connect AI assistants with your codebase
- **Real-time Monitoring**: Stream progress and results in real-time using SSE

## Technology Stack

- **TypeScript**: Built with TypeScript for type safety and modern language features
- **Deno Runtime**: Fast, secure, and modern JavaScript/TypeScript runtime
- **OpenAI Agents API**: Powers the reasoning and planning capabilities
- **E2B Code Interpreter SDK**: Provides secure code execution in a sandboxed environment
- **Vector Database**: Stores and indexes code changes for similarity search
- **Git Integration**: Works with your existing Git repositories
- **MCP Server**: Implements the Model Context Protocol for AI agent integration
- **Server-Sent Events**: Provides real-time streaming updates for long-running operations

## Installation

### NPM Installation (Recommended)

```bash
# Install globally
npm install -g @agentics.org/sparc2

# Or install locally in your project
npm install --save-dev @agentics.org/sparc2
```

### Manual Installation

```bash
# Clone the repository
git clone https://github.com/agenticsorg/sparc2.git
cd sparc2

# Install dependencies
deno cache --reload src/cli/cli.ts
```
 
# SPARC2 CLI

A comprehensive command-line interface for the SPARC2 project that integrates the E2B code interpreter and agent framework implementations.

## Installation

If you installed via npm:

```bash
# The CLI is available as the 'sparc2' command
sparc2 --help

# You can also use the 'sparc' command for direct execution
sparc --help
```

If you cloned the repository:

```bash
# Create an alias for easier use
alias sparc2="deno run --allow-read --allow-write --allow-env --allow-net --allow-run /path/to/sparc2/src/cli/cli.ts"

# Or use the provided script
./sparc --help
```

## Available Commands

SPARC2 CLI provides the following commands:

- **analyze**: Analyze code files for issues and improvements
- **modify**: Apply suggested modifications to code files
- **execute**: Execute code in a sandbox
- **search**: Search for similar code changes
- **checkpoint**: Create a git checkpoint
- **rollback**: Rollback to a previous checkpoint
- **config**: Manage configuration
- **api**: Start a Model Context Protocol (MCP) HTTP API server
- **mcp**: Start a Model Context Protocol (MCP) server using stdio transport

## Configuration

SPARC2 uses TOML configuration files:

- `config/sparc2-config.toml`: General configuration
- `config/agent-config.toml`: Agent-specific configuration

You can also set the configuration path using the environment variable:

```bash
export SPARC2_CONFIG_PATH=/path/to/your/config.toml
```

## Environment Variables

Create a `.env` file in your project root (you can copy from `.env.example`) or set these environment variables:

```
# Required
- `OPENAI_API_KEY`: Your OpenAI API key
- `E2B_API_KEY`: Your E2B API key

# Optional
- `OPENROUTER_API_KEY`: Your OpenRouter API key (optional)
- `SPARC2_CONFIG_PATH`: Custom path to your config file
- `NPM_TOKEN`: Your NPM token (only needed when publishing to npm)
- `MCP_SECRET_KEY`: Secret key for MCP server authentication
```

## MCP Server

SPARC2 includes a Model Context Protocol (MCP) server that allows AI agents to interact with your codebase. The MCP server provides a standardized interface for tools and resources discovery, enabling seamless integration with AI assistants.

### MCP Server Options

SPARC2 provides two different ways to use the Model Context Protocol (MCP):

#### 1. HTTP API Server

The `api` command starts an HTTP server that implements the MCP protocol over HTTP:

```bash
# Using the sparc command
./sparc api --port 3001

# Or with npm installation
sparc2 api --port 3001
```

Options:
- `--port, -p`: Port to run the API server on (default: 3001)
- `--model`: Model to use for the agent
- `--mode`: Execution mode (automatic, semi, manual, custom, interactive)
- `--diff-mode`: Diff mode (file, function)
- `--processing`: Processing mode (sequential, parallel, concurrent, swarm)
- `--config, -c`: Path to the agent configuration file

This is useful for integrations that communicate with SPARC2 over HTTP.

#### 2. MCP Stdio Server

The `mcp` command starts a server that implements the MCP protocol over standard input/output (stdio):

```bash
# Using the sparc command
./sparc mcp

# Or with npm installation
sparc2 mcp
```

Options:
- `--model`: Model to use for the agent
- `--mode`: Execution mode (automatic, semi, manual, custom, interactive)
- `--diff-mode`: Diff mode (file, function)
- `--processing`: Processing mode (sequential, parallel, concurrent, swarm)
- `--config, -c`: Path to the agent configuration file

This is useful for integrations with tools like VS Code extensions that communicate with SPARC2 over stdio.

### MCP Settings for VS Code Extensions

To use SPARC2 with VS Code extensions that support the Model Context Protocol (MCP), you'll need to configure the extension's settings. Here's an example configuration for the Claude extension:

```json
{
  "mcpServers": {
    "sparc2-mcp": {
      "command": "node",
      "args": [
        "/path/to/sparc2/src/mcp/mcpServerWrapper.js"
      ],
      "workingDirectory": "/path/to/sparc2",
      "disabled": false,
      "autoApprove": [
        "analyze_code",
        "modify_code",
        "search_code",
        "create_checkpoint",
        "rollback",
        "config"
      ],
      "env": {
        "OPENAI_API_KEY": "your-openai-api-key",
        "OPENROUTER_API_KEY": "your-openrouter-api-key",
        "E2B_API_KEY": "your-e2b-api-key",
        "MCP_SECRET_KEY": "your-mcp-secret-key",
        "SPARC2_CONFIG_PATH": "/path/to/sparc2/config.toml",
        "SPARC2_AGENT_CONFIG_PATH": "/path/to/sparc2/agent-config.toml",
        "OPENAI_MODEL": "gpt-4o"
      },
      "timeout": 300
    }
  }
}
```

The MCP server wrapper automatically detects the Deno executable in various common installation locations, making it portable across different systems.

### MCP Endpoints

The MCP server exposes the following endpoints:

- **GET /discover**: Returns a list of available tools and resources
- **GET /capabilities**: Alias for /discover, returns the same information
- **GET /list_tools**: Legacy endpoint that returns only the tools list
- **POST /analyze_code**: Analyzes code files for issues and improvements
- **POST /modify_code**: Applies suggested modifications to code files
- **POST /execute_code**: Executes code in a secure sandbox
- **POST /search_code**: Searches for similar code changes
- **POST /create_checkpoint**: Creates a git checkpoint
- **POST /rollback**: Rolls back to a previous checkpoint
- **POST /config**: Manages configuration settings

### MCP Tools

The SPARC2 MCP server provides the following tools:

#### 1. analyze_code
Analyzes code files for issues and improvements.

**Parameters**:
- `files`: Array of file paths to analyze (required)
- `task`: Description of the analysis task

**Returns**: Analysis results with suggestions for improvements

#### 2. modify_code
Applies suggested modifications to code files.

**Parameters**:
- `files`: Array of file paths to modify (required)
- `task`: Description of the modification task

**Returns**: Results of the modifications applied

#### 3. execute_code
Executes code in a secure sandbox.

**Parameters**:
- `code`: Code to execute (required)
- `language`: Programming language (python, javascript, typescript) (required)

**Returns**: Execution results including stdout, stderr, and any errors

#### 4. search_code
Searches for similar code changes.

**Parameters**:
- `query`: Search query (required)
- `limit`: Maximum number of results to return

**Returns**: Array of search results with relevance scores

#### 5. create_checkpoint
Creates a version control checkpoint.

**Parameters**:
- `name`: Checkpoint name (required)

**Returns**: Checkpoint information including commit hash

#### 6. rollback
Rolls back to a previous checkpoint.

**Parameters**:
- `commit`: Commit hash to roll back to (required)

**Returns**: Result of the rollback operation

#### 7. config
Manages configuration.

**Parameters**:
- `action`: Action to perform (get, set, list) (required)
- `key`: Configuration key (required for get/set)
- `value`: Configuration value (required for set)

**Returns**: Configuration operation result

### MCP Resources

The SPARC2 MCP server provides the following resources:

#### 1. git_repository
Git repository for version control and checkpointing.

**Properties**:
- `path`: Path to the git repository
- `branch`: Current branch name

**Methods**:
- **create_checkpoint**: Creates a checkpoint in the git repository
  - Parameters: `name` (Name of the checkpoint)
  - Returns: Checkpoint information including commit hash
- **rollback**: Rolls back to a previous checkpoint
  - Parameters: `commit` (Commit hash to roll back to)
  - Returns: Result of the rollback operation

#### 2. vector_store
Vector database for storing and searching code changes and logs.

**Properties**:
- `id`: ID of the vector store
- `size`: Number of entries in the vector store

**Methods**:
- **search**: Searches for similar entries in the vector store
  - Parameters: `query` (Search query), `limit` (Maximum number of results)
  - Returns: Array of search results with relevance scores
- **index**: Indexes a new entry in the vector store
  - Parameters: `content` (Content to index), `metadata` (Metadata for the entry)
  - Returns: Result of the indexing operation

#### 3. sandbox
Secure sandbox for executing code.

**Properties**:
- `languages`: Supported programming languages
- `timeout`: Maximum execution time in seconds

**Methods**:
- **execute**: Executes code in the sandbox
  - Parameters: `code` (Code to execute), `language` (Programming language)
  - Returns: Execution results including stdout, stderr, and any errors

### Testing MCP Endpoints with curl

You can test the MCP server endpoints using curl commands. First, start the MCP server:

```bash
./sparc api --port 3001
```

#### 1. Discover Available Tools and Resources

```bash
curl -X GET http://localhost:3001/discover
```

This will return a JSON object containing all available tools and resources.

#### 2. Execute Code

```bash
curl -X POST http://localhost:3001/execute_code \
  -H "Content-Type: application/json" \
  -d '{
    "code": "console.log(\"Hello, SPARC2!\"); const sum = (a, b) => a + b; console.log(sum(5, 3));",
    "language": "javascript"
  }'
```

Response:
```json
{
  "result": "Hello, SPARC2!\n8",
  "details": {
    "logs": {
      "stdout": ["Hello, SPARC2!", "8"],
      "stderr": []
    }
  }
}
```

#### 3. Analyze Code Files

```bash
curl -X POST http://localhost:3001/analyze_code \
  -H "Content-Type: application/json" \
  -d '{
    "files": ["path/to/file.js"],
    "task": "Check for performance issues and suggest improvements"
  }'
```

#### 4. Modify Code Files

```bash
curl -X POST http://localhost:3001/modify_code \
  -H "Content-Type: application/json" \
  -d '{
    "files": ["path/to/file.js"],
    "task": "Optimize the rendering function"
  }'
```

#### 5. Search for Code Patterns

```bash
curl -X POST http://localhost:3001/search_code \
  -H "Content-Type: application/json" \
  -d '{
    "query": "Fix performance issue in rendering",
    "limit": 5
  }'
```

#### 6. Create a Checkpoint

```bash
curl -X POST http://localhost:3001/create_checkpoint \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Optimized rendering function"
  }'
```

#### 7. Roll Back to a Previous Checkpoint

```bash
curl -X POST http://localhost:3001/rollback \
  -H "Content-Type: application/json" \
  -d '{
    "commit": "abc123def456"
  }'
```

#### 8. Manage Configuration

List configuration:
```bash
curl -X POST http://localhost:3001/config \
  -H "Content-Type: application/json" \
  -d '{
    "action": "list"
  }'
```

Get a specific configuration value:
```bash
curl -X POST http://localhost:3001/config \
  -H "Content-Type: application/json" \
  -d '{
    "action": "get",
    "key": "DIFF_MODE"
  }'
```

Set a configuration value:
```bash
curl -X POST http://localhost:3001/config \
  -H "Content-Type: application/json" \
  -d '{
    "action": "set",
    "key": "DIFF_MODE",
    "value": "function"
  }'
```

## Using as a Library

SPARC2 can also be used as a library in your own projects:

```typescript
import { SPARC2Agent } from '@agentics.org/sparc2';
```

### Analyze Code

Analyze code files for issues and improvements:

```bash
deno run --allow-read --allow-write --allow-env --allow-net src/cli/cli.ts analyze --files path/to/file.js
```

Or if installed via npm:

```bash
sparc2 analyze --files path/to/file.js
```

Options:
- `--files`: Comma-separated list of files to analyze (required)
- `--output, -o`: Output file for analysis results
- `--model`: Model to use for analysis
- `--mode`: Execution mode (automatic, semi, manual, custom)
- `--diff-mode`: Diff mode (file, function)
- `--processing`: Processing mode (parallel, sequential, concurrent, swarm)

### Modify Code

Apply suggested modifications to code files:

```bash
deno run --allow-read --allow-write --allow-env --allow-net src/cli/cli.ts modify --files path/to/file.js --suggestions "Fix the bug in the multiply function"
```

Or if installed via npm:

```bash
sparc2 modify --files path/to/file.js --suggestions "Fix the bug in the multiply function"
```

Options:
- `--files`: Comma-separated list of files to modify (required)
- `--suggestions, -s`: Suggestions file or string (required)
- `--model`: Model to use for modifications
- `--mode`: Execution mode (automatic, semi, manual, custom)
- `--diff-mode`: Diff mode (file, function)
- `--processing`: Processing mode (parallel, sequential, concurrent, swarm)

### Execute Code

Execute code in a sandbox:

```bash
deno run --allow-read --allow-write --allow-env --allow-net src/cli/cli.ts execute --file path/to/file.js
```

Or if installed via npm:

```bash
sparc2 execute --file path/to/file.js
```

Options:
- `--file`: File to execute
- `--code`: Code to execute (alternative to --file)
- `--language, -l`: Programming language (python, javascript, typescript)
- `--stream`: Stream output (boolean)
- `--timeout`: Timeout in milliseconds

### Search for Similar Code Changes

Search for similar code changes:

```bash
deno run --allow-read --allow-write --allow-env --allow-net src/cli/cli.ts search --query "Fix multiplication bug"
```

Or if installed via npm:

```bash
sparc2 search --query "Fix multiplication bug"
```

Options:
- `--query`: Search query (required)
- `--max-results, -n`: Maximum number of results (default: 5)

### Create a Git Checkpoint

Create a git checkpoint:

```bash
deno run --allow-read --allow-write --allow-env --allow-net src/cli/cli.ts checkpoint --message "Fixed multiplication bug"
```

Or if installed via npm:

```bash
sparc2 checkpoint --message "Fixed multiplication bug"
```

Options:
- `--message, -m`: Checkpoint message (required)

### Rollback to a Previous Checkpoint

Rollback to a previous checkpoint:

```bash
deno run --allow-read --allow-write --allow-env --allow-net src/cli/cli.ts rollback --commit abc123
```

Or if installed via npm:

```bash
sparc2 rollback --commit abc123
```

Options:
- `--commit`: Commit hash or date to rollback to (required)

### Manage Configuration

Manage configuration:

```bash
deno run --allow-read --allow-write --allow-env --allow-net src/cli/cli.ts config --action list
```

Or if installed via npm:

```bash
sparc2 config --action list
```

Options:
- `--action`: Configuration action (get, set, list) (required)
- `--key`: Configuration key (required for get/set)
- `--value`: Configuration value (required for set)

## Examples

### Basic Usage Examples

#### Analyze a JavaScript File

```bash
sparc2 analyze --files src/app.js
```

#### Modify Multiple Files

```bash
sparc2 modify --files src/app.js,src/utils.js --suggestions suggestions.txt
```

#### Execute a Python File

```bash
sparc2 execute --file script.py --language python
```

#### Search for Code Changes

```bash
sparc2 search --query "Fix performance issue" --max-results 10
```

#### Create a Checkpoint

```bash
sparc2 checkpoint --message "Implemented new feature"
```

#### Rollback to a Date

```bash
sparc2 rollback --commit "2023-01-01"
```

#### Get a Configuration Value

```bash
sparc2 config --action get --key "models.reasoning"
```

#### Set a Configuration Value

```bash
sparc2 config --action set --key "models.reasoning" --value "gpt-4o"
```

#### Start the MCP HTTP API Server

```bash
./sparc api --port 3001
```

#### Start the MCP Stdio Server

```bash
./sparc mcp
```

### Advanced Usage Examples

#### Analyze Code with Custom Model and Processing Mode

```bash
sparc2 analyze --files src/app.js --model gpt-4o --processing parallel
```

#### Modify Code with Function-Level Diff Tracking

```bash
sparc2 modify --files src/app.js --suggestions "Optimize the rendering function" --diff-mode function
```

#### Execute Code with Streaming Output

```bash
sparc2 execute --file script.py --language python --stream
```

#### Create a Workflow Script

```bash
#!/bin/bash
# Analyze and fix performance issues

# Analyze the code
sparc2 analyze --files src/app.js --output analysis.json

# Apply fixes
sparc2 modify --files src/app.js --suggestions analysis.json

# Create a checkpoint
sparc2 checkpoint --message "Fixed performance issues"

# Test the changes
sparc2 execute --file src/app.js
```

## Testing

Run the CLI tests:

```bash
deno test --allow-read --allow-write --allow-env --allow-net --allow-run tests/cli-test.ts
```

## License

MIT
