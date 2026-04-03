# Kalera Claude Code

> **Bộ công cụ Claude Code hoàn chỉnh — nền tảng everything-claude-code + hệ thống bộ nhớ dài hạn Munin.**

[![Stars](https://img.shields.io/github/stars/3d-era/kalera-claude-code?style=flat)](https://github.com/3d-era/kalera-claude-code/stargazers)
[![MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

---

## Đây Là Cái Gì?

**Kalera Claude Code** là một plugin Claude Code sẵn sàng sản xuất, kết hợp:

- ✅ **Everything Claude Code** — [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code) (50K+ stars, giải hackathon Anthropic). Agents, skills, hooks, rules, commands đã được thử nghiệm thực tế, hỗ trợ 10+ ngôn ngữ.
- ✅ **Munin Memory System** — Bộ nhớ dài hạn với GraphRAG, tự động nạp ngữ cảnh phiên, danh mục lỗi, và bộ nhớ riêng theo dự án.

Một lệnh cài đặt. Mọi thứ bạn cần.

---

## Tính Năng

### Từ Everything Claude Code (của [Affaan Mustafa](https://x.com/affaanmustafa))

| Danh mục | Số lượng | Ví dụ |
|----------|----------|--------|
| **Agents** | 31 | `code-reviewer`, `security-reviewer`, `build-error-resolver`, reviewer theo ngôn ngữ |
| **Skills** | 142 | `tdd-workflow`, `security-review`, `api-design`, `docker-patterns`, `python-patterns`, v.v. |
| **Commands** | 50 | `/multi-plan`, `/multi-execute`, `/prp-*` workflow, `/loop-*`, `/prompt-optimize` |
| **Rules** | 75+ | Rules chung + TypeScript, Python, Go, Java, Kotlin, C++, Rust, Swift, PHP |
| **Hooks** | 20+ | PreToolUse, PostToolUse, Stop, SessionEnd |

### Từ Munin Memory System

| Tính năng | Mô tả |
|------------|--------|
| **Session Start** | Tự động nạp bộ nhớ dự án mỗi khi bắt đầu phiên |
| **GraphRAG Memory** | Tìm kiếm ngữ nghĩa + trích xuất đồ thị tri thức |
| **Error Catalog** | Tìm → sửa → lưu loop cho bugs |
| **Per-Project Memory** | Mỗi dự án có bộ nhớ riêng |
| **Mã hóa E2EE** | Mã hóa đầu cuối cho bộ nhớ |
| **Chia sẻ Cross-Project** | Chia sẻ memories giữa các dự án qua Hash Key |

---

## Cài Đặt Nhanh — Một Lệnh

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

# 3. Cài Munin memory (tùy chọn nhưng khuyến khích)
/plugin install munin-claude-code@kalera-cc

# 4. Khởi động lại Claude Code
```

### Sau Khi Cài — Thiết Lập Munin

```bash
# Đăng ký miễn phí tại https://munin.kalera.app
# Tạo project, copy Project ID của bạn

# Thêm vào .env của dự án:
echo "MUNIN_PROJECT=proj_your_id" >> .env

# Xong! Munin tự nạp ngữ cảnh mỗi phiên
```

---

## Cấu Trúc

```
kalera-claude-code/
|-- .claude-plugin/          # Plugin manifest + marketplace
|
|-- plugins/
|   |-- munin-claude-code/   # Plugin Munin memory (nhúng sẵn)
|       |-- agents/               # Agent @munin
|       |-- skills/               # munin-memory, munin-architecture, munin-error-catalog
|       |-- hooks/                # session-start, post-compact, stop, error-catalog
|       |-- .mcp.json             # Cấu hình MCP server
|
|-- agents/               # 31 agents chuyên biệt
|-- skills/             # 142 workflow skills
|-- commands/           # 50 slash commands
|-- rules/              # Common + 10 hệ sinh thái ngôn ngữ
|-- hooks/              # Production-ready hooks
|-- mcp-configs/       # MCP servers (GitHub, Supabase, Vercel, Railway, v.v.)
|-- install.sh          # Installer một lệnh
```

---

## Agents (31)

**Reviewer theo ngôn ngữ:** `typescript-reviewer`, `python-reviewer`, `go-reviewer`, `java-reviewer`, `kotlin-reviewer`, `rust-reviewer`, `cpp-reviewer`, `csharp-reviewer`, `flutter-reviewer`, `dart-reviewer`

**Build resolvers:** `go-build-resolver`, `java-build-resolver`, `kotlin-build-resolver`, `rust-build-resolver`, `cpp-build-resolver`, `dart-build-resolver`, `pytorch-build-resolver`

**Chuyên biệt:** `code-reviewer`, `security-reviewer`, `database-reviewer`, `build-error-resolver`, `refactor-cleaner`, `doc-updater`, `docs-lookup`, `gan-planner`, `gan-generator`, `gan-evaluator`, `opensource-forker`, `opensource-packager`, `opensource-sanitizer`, `performance-optimizer`, `healthcare-reviewer`

---

## MCP Servers

GitHub · Supabase · Vercel · Railway · Firecrawl · Exa Search · Sequential Thinking · Cloudflare (Workers, Observability) · ClickHouse · Confluence · Fal.ai · Browserbase · Devfleet · Magic UI

---

## Credits

### Everything Claude Code
> Bởi [Affaan Mustafa](https://github.com/affaan-m) — [github.com/affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)

50K+ stars, giải hackathon Anthropic x Forum Ventures (Sep 2025). Repo này là **fork trực tiếp** — tất cả agents, skills, commands, hooks và rules được lấy từ bản gốc. Kalera Claude Code loại bỏ xung đột, thêm Munin memory, và duy trì remote `upstream` để track updates.

### Munin Memory System
> Bởi [Kalera / 3D-Era](https://kalera.app) — [munin.kalera.app](https://munin.kalera.app)

Hệ thống bộ nhớ dài hạn với GraphRAG. Built as a plugin at [3d-era/munin-for-agents](https://github.com/3d-era/munin-for-agents).

---

## Đóng Góp

PRs được chào đón! Repo này track upstream `affaan-m/everything-claude-code` qua `git remote upstream`.

- **Cải thiện ECC upstream**: contribute trực tiếp vào [repo gốc](https://github.com/affaan-m/everything-claude-code)
- **Lớp Kalera** (tích hợp Munin, install story): PRs vào repo này

---

## Giấy Phép

MIT — Giống như everything-claude-code. Munin cũng MIT.
