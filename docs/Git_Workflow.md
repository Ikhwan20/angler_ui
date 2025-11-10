# 🌿 Git Workflow for Angler_UI

This document explains how our team manages branches, commits, and pull requests to keep our project clean and consistent.

---

## 🧱 Branch Structure

We use a **3-tier branching model**:

| Branch | Purpose | Notes |
|---------|----------|--------|
| `main` | Production-ready, stable code | Only merged from `staging` |
| `staging` | Pre-release branch for QA/testing | Merged from `develop` |
| `develop` | Active development branch | Merged from feature branches |

Feature branches are short-lived and named after their task:
```

feature/<short-description>
bugfix/<short-description>
docs/<short-description>

```
Example:
```

feature/add-loading-widget
bugfix/fix-login-button

````

---

## 🔧 Workflow Steps

### 1. Update local branches
```bash
git checkout main
git pull origin main
git checkout develop
git pull origin develop
````

### 2. Create a new branch for your work

```bash
git checkout -b feature/add-loading-widget
```

### 3. Make your changes and test locally

```bash
flutter analyze
flutter test
```

### 4. Commit your work

Use conventional commit messages:

```bash
git add .
git commit -m "feat: add loading widget under splash logo"
```

Commit types:

| Type       | Description               |
| ---------- | ------------------------- |
| `feat`     | New feature               |
| `fix`      | Bug fix                   |
| `refactor` | Code improvement          |
| `docs`     | Documentation changes     |
| `test`     | Adding or improving tests |
| `chore`    | Maintenance or CI/CD      |

---

### 5. Push your branch and create a Pull Request

```bash
git push origin feature/add-loading-widget
```

Then go to GitHub → open a **Pull Request (PR)** to merge into `develop`.

---

### 6. Review & merge process

1. Another team member reviews your PR.
2. If changes are requested, update your branch and push again.
3. Once approved → merge into `develop`.
4. When `develop` is stable → the lead merges into `staging`.
5. When staging passes QA → it’s merged into `main`.

---

### 7. Deployment flow

| Environment | Branch    | Deployment               |
| ----------- | --------- | ------------------------ |
| Development | `develop` | Local & test devices     |
| Staging     | `staging` | QA / pre-release testing |
| Production  | `main`    | Live release build       |

---

## ✅ Code Review Checklist

Before merging:

* [ ] Code builds with no errors
* [ ] `flutter analyze` passes
* [ ] `flutter test` passes
* [ ] No debug prints left
* [ ] PR linked to issue or task
* [ ] Screenshots attached (if UI change)

---

## 💬 Notes for Contributors

* Never commit directly to `main` or `staging`.
* Keep your feature branches small and focused.
* Always use Pull Requests to merge code.
* Tag releases on `main` (e.g. `v1.0.0`).

---

👥 **Maintainers**

* Project Lead: `@ikhwan20`
* Contributors: `@ajankun`

---

*This workflow keeps Angler_UI’s code stable, organized, and easy to scale as our team grows.*
