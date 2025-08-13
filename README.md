# RAG + MCP Learning System

A composable RAG (Retrieval-Augmented Generation) orchestration system built with MCP (Model Context Protocol) for educational and experimental purposes.

## 🎯 What This Is

This is a **learning and experimentation environment** that demonstrates how to build composable RAG systems using modern MCP patterns. Think of it as a "laboratory" for exploring different RAG approaches and orchestration strategies.

## 📚 Documentation

- **[`notebook.md`](notebook.md)** - Template for creating new RAG notebooks
- **[`orchestration.md`](orchestration.md)** - Advanced patterns for combining RAG tools  
- **[`server.md`](server.md)** - MCP server architecture and tool registration

## �️ Project Structure

```
├── server.py                          # MCP server with RAG tools
├── rag_mcp_orchestrator_demo.ipynb   # Demo showing tool usage
├── workers/                           # RAG implementation notebooks
│   ├── rag_hello_one_mcp.ipynb       # Basic semantic search
│   └── rag_hello_two_mcp.ipynb       # Enhanced search with metadata
├── runs/                              # Executed notebooks (preserved for inspection)
├── data/                              # Sample corpus data
└── docs/                              # Templates and patterns
    ├── notebook.md                    # RAG notebook template
    ├── orchestration.md               # Orchestration patterns
    └── server.md                      # Server documentation
```

## 🚀 Quick Start

### 1. Demo the System
```jupyter
# Open and run the main demo
rag_mcp_orchestrator_demo.ipynb
```

### 2. Test MCP Tools
```python
from server import rag_semantic_search, rag_enhanced_search

# Get answer only
result = rag_semantic_search("What is machine learning?")
print(result["answer"])

# Get chunks for processing
result = rag_semantic_search("AI concepts", return_chunks=True, return_answer=False)
chunks = result["chunks"]
```

### 3. Create New RAG Method
1. Copy the template from `notebook.md`
2. Implement your RAG approach
3. Register it in `server.py` as a new MCP tool
4. Use it standalone or in orchestration workflows

## 🔧 Key Features

### Composable Architecture
- **Simple Tools**: Each RAG method is a focused tool
- **Boolean Control**: Precise output control with `return_chunks`/`return_answer`
- **Flexible Data**: Tools return adaptable JSON structures
- **Orchestration Ready**: Combine tools for complex workflows

### Learning-Friendly
- **Template-Driven**: Standard structure for new implementations
- **Execution Traces**: Notebooks saved in `runs/` for inspection
- **Rich Documentation**: Comprehensive guides and patterns
- **Debug Support**: Full parameter injection and output tracing

### Modern MCP Patterns
- **FastMCP Integration**: Proper tool definitions with schema
- **Rich Descriptions**: LLM-friendly tool documentation
- **Flexible Transport**: In-memory for development, stdio for production
- **Standard Protocol**: Compatible with MCP ecosystem

## 🎓 Educational Use Cases

### For Students
- Learn modern RAG architectures
- Experiment with different retrieval methods
- Practice MCP tool development
- Build orchestration workflows

### For Researchers  
- Prototype new RAG approaches
- Compare method performance
- Develop novel orchestration patterns
- Share reproducible experiments

### For Developers
- Understand composable AI architectures  
- Learn MCP best practices
- Build production-ready patterns
- Design tool ecosystems

## 🔄 Orchestration Examples

### Multi-Method Fusion
```python
# Combine semantic + keyword search
semantic_chunks = rag_semantic_search(query, return_chunks=True, return_answer=False)
keyword_chunks = rag_keyword_search(query, return_chunks=True, return_answer=False)
combined_result = rag_reranker(query, chunks=semantic_chunks + keyword_chunks)
```

### Query Decomposition
```python
# Break complex queries into parts
sub_queries = decompose_query(complex_query)
all_chunks = []
for sub_query in sub_queries:
    chunks = rag_semantic_search(sub_query, return_chunks=True, return_answer=False)
    all_chunks.extend(chunks)
final_answer = rag_generator(complex_query, chunks=all_chunks)
```

## 🛠️ Development

### Adding New RAG Methods
1. Follow the template in `notebook.md`
2. Implement in `workers/your_method.ipynb`
3. Add tool definition to `server.py`
4. Test and document

### Advanced Patterns
See `orchestration.md` for sophisticated combination strategies including:
- Multi-method fusion
- Iterative refinement  
- Sub-query decomposition
- Agentic orchestration

## 🎯 Next Steps

This system provides the foundation for exploring advanced RAG concepts:

- **Hybrid Search**: Combine semantic, keyword, and graph-based retrieval
- **Adaptive RAG**: Dynamic method selection based on query characteristics  
- **Multi-Stage Processing**: Iterative refinement and verification
- **Agentic Workflows**: LLM-driven orchestration of multiple tools

Happy experimenting! 🚀
# Open the clean template
rag_mcp_clean.ipynb
```

### For MCP Learning
```bash
# See both mock and real approaches
rag_mcp_educational.ipynb
```

### For External LLM Integration
```bash
python server.py
# Connect your LLM client to this MCP server
```

## 🎯 Key Architecture

**FastMCP In-Memory Connection** - perfect for notebook development:
```python
from fastmcp import Client
from mcp.server.fastmcp import FastMCP

# Create server
mcp = FastMCP("my-server")

# Connect in-memory (no stdio issues!)
async with Client(mcp) as client:
    result = await client.call_tool("my_tool", {})
```

**Training Focus:** Users learn to USE the MCP system, not build it  
**MCP Course Focus:** Deep dive into MCP protocol and implementation details

## 🎯 Key Insights

**FastMCP In-Memory Connection** is the best approach for notebook development:
```python
from fastmcp import Client
from mcp.server.fastmcp import FastMCP

# Create server
mcp = FastMCP("my-server")

# Connect in-memory (no stdio issues!)
async with Client(mcp) as client:
    result = await client.call_tool("my_tool", {})
```

This avoids all the subprocess/stdio complexity while providing real MCP protocol compliance!