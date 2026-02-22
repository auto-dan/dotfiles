# AGENTS.md - Codebase Guide for Agentic Coding Agents

## Project Overview
This repository contains configuration files for a Linux desktop environment, primarily focused on tools like Hyprland, Neovim, Waybar, and other desktop utilities. It's a dotfiles repository with various configuration files for desktop environments.

## Code Style Guidelines

### File Naming Conventions
- All files named in lowercase with hyphens or underscores (e.g., `hyprland.conf`)
- Configuration files in root directory with descriptive names
- Files with `*.json` extension should have proper JSON formatting
- Use `.config` for configuration directory structure

### File Structure
- Configuration files should have clear sections with comments
- All JSON files must be properly formatted with consistent indentation
- Indentation: 2 spaces for configuration files
- End every file with a newline character

### Comments and Documentation
- Use `//` for inline comments in configuration files that support them
- Use single-line comments at the beginning of files to describe purpose
- Each section should be clearly marked with a comment block

### Formatting Rules
- Indentation: 2 spaces (for config files)
- Line width: 80 characters maximum
- All JSON files must be valid and formatted consistently
- Configuration files should end with a newline

### Import/Export Style
- All imports from system paths should be relative when possible
- No external package dependencies in this codebase

### Error Handling
- This is a configuration repository with no runtime code
- All configuration validation should be done manually
- Files should be validated with JSON schema when applicable
- Ensure all configuration paths are correct and accessible

### Git Commit Messages
- Follow conventional commit message format
- Use present tense and imperative mood
- First line of commit message should be 50 characters maximum
- Include brief description of changes in body

## Special Considerations

### Security
- Configuration files may contain sensitive information
- Always ensure proper file permissions (600 for sensitive files)
- Never commit credentials or sensitive configurations

### System Integration
- Configuration files are specific to system environments
- Files should be validated to work with the targeted OS version
- Ensure compatibility with the target desktop environment

### Code Quality
- Configuration files should be minimal yet complete
- Comments should help understand complex configuration, not just repeat code
- All files should be kept organized in logical directories
- Configuration should be documented for users who might modify it

## Tool-Specific Instructions

### Neovim Configuration
- Configuration files should be formatted using standard JSON/YAML syntax
- All paths in configurations should be either absolute or relative to the project root

### Hyprland Configuration
- All configurations should be compatible with the installed version
- Files should be carefully checked for valid syntax before use

Note: This is a configuration repository with no actual code. Configuration files should be validated manually rather than tested with automated systems.
