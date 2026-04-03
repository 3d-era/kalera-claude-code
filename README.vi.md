# Kalera Claude Code

> **Cách Kalera dùng Claude Code.** Nguyên liệu từ everything-claude-code (50K+ stars) + bí quyết của Kalera: bộ nhớ Munin, cấu hình hợp lý, và workflow thực sự ship được.

[![Stars](https://img.shields.io/github/stars/3d-era/kalera-claude-code?style=flat)](https://github.com/3d-era/kalera-claude-code/stargazers)
[![MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

---

## Đây Là Cái Gì?

Đây là **bộ Claude Code Kalera dùng mỗi ngày.** Built trên [everything-claude-code](https://github.com/affaan-m/everything-claude-code) — 50K+ stars, giải hackathon Anthropic — rồi được tinh chỉnh thêm:

- 🧠 **Munin** — Bộ nhớ dài hạn. Claude nhớ dự án, nhớ bugs, nhớ quyết định. Không lặp lại.
- ⚙️ **Plugins được cấu hình sẵn** — Security audit, AI/ML, frontend, parallel research, HuggingFace, và hơn nữa.
- 🚀 **Install một lệnh** — Xong trên máy mới trong 2 phút.

Nếu everything-claude-code là **nguyên liệu**, thì đây là **công thức.**

---

## Trong Đó Có Gì

### Plugins (26 total)

Đã cài và test chung với nhau. Không phải đoán compatibility.

**Từ Claude Plugins Official:**
`frontend-design` · `context7` · `code-review` · `feature-dev` · `playwright` · `claude-md-management` · `claude-code-setup` · `huggingface-skills` · `skill-creator`

**Từ Community Marketplaces:**
`audit` · `explore` · `frontend-developer` · `lyra` · `optimize` · `ui-designer` · `ultrathink` · `ai-engineer` · `api-integration-specialist` · `bug-detective` · `problem-solver-specialist` · `parallel` · `claude-hud`

**Từ Kalera:**
`munin-claude-code` — Bộ nhớ dài hạn (xem bên dưới)

### Từ Everything Claude Code (lớp nền)

| Danh mục | Số lượng | Ví dụ |
|----------|-----------|--------|
| **Agents** | 31 | `code-reviewer`, `security-reviewer`, `build-error-resolver`, reviewer theo ngôn ngữ |
| **Skills** | 142 | `tdd-workflow`, `security-review`, `api-design`, `docker-patterns`, `python-patterns`, v.v. |
| **Commands** | 50 | `/multi-plan`, `/multi-execute`, `/prp-*` workflow, `/loop-*`, `/prompt-optimize` |
| **Rules** | 75+ | Rules chung + TypeScript, Python, Go, Java, Kotlin, C++, Rust, Swift, PHP |
| **Hooks** | 20+ | PreToolUse, PostToolUse, Stop, SessionEnd |

### Từ Munin Memory System (bí quyết của Kalera)

| Tính năng | Mô tả |
|------------|--------|
| **Session Start** | Tự động nạp bộ nhớ dự án mỗi khi bắt đầu phiên |
| **GraphRAG Memory** | Tìm kiếm ngữ nghĩa + trích xuất đồ thị tri thức |
| **Error Catalog** | Tìm → sửa → lưu loop cho bugs |
| **Per-Project Memory** | Mỗi dự án có bộ nhớ riêng |
| **Mã hóa E2EE** | Mã hóa đầu cuối cho bộ nhớ |
| **Chia sẻ Cross-Project** | Chia sẻ memories giữa các dự án qua Hash Key |

---

## Cài Đặt Nhanh

### Bước 1 — Tài Khoản Munin (Miễn Phí, Cần Để Dùng Memory)

> Munin cần tài khoản để lưu memories. **Miễn phí.** Đăng ký mất 30 giây.

1. Vào [munin.kalera.app](https://munin.kalera.app) → **Sign Up** (miễn phí)
2. Tạo project → copy **Project ID** của bạn (`proj_xxxxxxxxxxxx`)

### Bước 2 — Cài Đặt

```bash
# One-liner installer
bash -c "$(curl -fsSL https://raw.githubusercontent.com/3d-era/kalera-claude-code/main/install.sh)"
```

Hoặc từng bước:

```bash
# 1. Thêm marketplace
/plugin marketplace add kalera-cc

# 2. Cài plugin chính (everything-claude-code)
/plugin install everything-claude-code@kalera-cc

# 3. Cài Munin memory
/plugin install munin-claude-code@kalera-cc

# 4. Khởi động lại Claude Code
```

### Bước 3 — Set Munin Project ID

```bash
# Chạy lệnh này trong Claude Code:
/munin-projectid

# Nó sẽ hiện project ID hiện tại hoặc hỏi bạn nhập.
# Dán Project ID của bạn khi được yêu cầu.
```

---

## Lệnh Munin

```bash
@munion lần trước chúng ta đang làm gì?
@munion tìm bugs về payment API
@munion xem các quyết định kiến trúc

/munin-projectid   # Kiểm tra hoặc set project ID
/munin-memory     # Tìm kiếm memories của dự án
/munin-architecture # Xem ngữ cảnh tech stack
/munin-error-catalog # Tìm và sửa bugs đã biết
```

---

## Cách Kalera Làm Việc — Orchestration Patterns

Đây là **bí quyết** giúp Claude Code thực sự ship thay vì chỉ chat:

> **Mọi sub-agent phải gọi Munin ở start và store ở end.** Xem Memory Protocol bên trên.

### Parallel Agents — Không Sequential Nếu Không Cần Thiết

```
Cho multi-step tasks: spawn tất cả agents độc lập cùng lúc trong MỘT response.

Agent A → Đọc / Hiểu codebase
Agent B → Research / Tra docs
Agent C → Lên kế hoạch
      ↓
Synthesize kết quả lại
```

### Chọn Model

| Model | Khi nào dùng |
|-------|---------------|
| **Haiku** | Tra cứu nhanh, linting, unit tests |
| **Sonnet** | Feature thường, refactoring |
| **Opus** | Kiến trúc phức tạp, debug sâu, security |

### Fork vs Fresh

| | Dùng khi |
|--|----------|
| **Fork** (không có `subagent_type`) | Agent cần full context của Pa |
| **Fresh** (`subagent_type` set) | Task độc lập — tiết kiệm tokens |

### Research First — Rồi Mới Build

```
Task phức tạp?
  → Spawn Explore agent TRƯỚC để hiểu codebase
  → Đợi findings
  → Rồi spawn Coder agent với context đó
  → Rồi spawn Reviewer agent để verify
```

### Workflow: Fix Bug

```
1. @munin tìm trong error catalog
2. Có fix cũ → present ngay
3. Không có → fix + store resolution
```

---

## Cấu Trúc

```
kalera-claude-code/
|-- .claude-plugin/          # Plugin manifest + marketplace
|
|-- plugins/
|   |-- munin-claude-code/   # Plugin Munin memory (bí quyết của Kalera)
|       |-- agents/               # Agent @munin
|       |-- skills/               # munin-memory, munin-architecture, munin-error-catalog
|       |-- hooks/                # session-start, post-compact, stop, error-catalog
|       |-- .mcp.json             # Cấu hình MCP server
|
|-- agents/               # 31 agents chuyên biệt
|-- skills/             # 142 workflow skills
|-- commands/           # 50 slash commands
|-- rules/             # Common + 10 hệ sinh thái ngôn ngữ
|-- hooks/             # Production-ready hooks
|-- mcp-configs/       # MCP servers (GitHub, Supabase, Vercel, Railway, v.v.)
|-- scripts/             # Node.js utilities
|-- install.sh          # Installer một lệnh
```

---

## Credits

### Everything Claude Code
> Bởi [Affaan Mustafa](https://github.com/affaan-m) — [github.com/affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)

50K+ stars, giải hackathon Anthropic x Forum Ventures (Sep 2025). **Kalera Claude Code là fork trực tiếp** — tất cả agents, skills, commands, hooks và rules được lấy từ bản gốc. Chúng tôi duy trì `upstream` remote để track updates.

### Munin Memory System
> Bởi [Kalera](https://kalera.app) — [munin.kalera.app](https://munin.kalera.app)

Hệ thống bộ nhớ dài hạn với GraphRAG. Built at [3d-era/munin-for-agents](https://github.com/3d-era/munin-for-agents).

### Claude Code Plugins Official
> [claude.ai/plugins](https://claude.ai/plugins) — frontend-design, context7, code-review, feature-dev, playwright, huggingface-skills, skill-creator, và hơn nữa.

### Community Marketplaces
> `cc-marketplace` (ananddtyagi/cc-marketplace) · `parallel-agent-skills` (parallel-web/parallel-agent-skills) · `claude-hud` (jarrodwatts/claude-hud)

---

## Đóng Góp

PRs được chào đón! Repo này track upstream `affaan-m/everything-claude-code` qua `git remote upstream`.

- **Cải thiện ECC upstream**: contribute trực tiếp vào [repo gốc](https://github.com/affaan-m/everything-claude-code)
- **Lớp Kalera** (tích hợp Munin, install story, Kalera plugins): PRs vào repo này

---

## Giấy Phép

MIT — Giống như everything-claude-code. Munin cũng MIT.
