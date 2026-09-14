# Homebrew tap for AI Observer

AI Observer collects completion events from Claude Code, Codex CLI, Gemini CLI, and Pi in a local observation page.

```sh
brew trust --formula yosyus-Yo/tap/ai-observer
brew install yosyus-Yo/tap/ai-observer
ai-observer connect
```

`ai-observer connect` detects installed Claude Code, Codex CLI, and Gemini CLI clients, safely merges their completion hooks, and starts the local observer. Restart each CLI afterward. Codex requires one manual trust confirmation in `/hooks`.

Optional managed service:

```sh
brew services start yosyus-Yo/tap/ai-observer
```

Upstream: <https://github.com/yosyus-Yo/ai-observer>
