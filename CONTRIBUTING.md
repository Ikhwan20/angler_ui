# 🐟 Contributing to Angler_UI

Thank you for your interest in contributing to **Angler_UI** 🎣  
We’re excited to have you help make the app better!

This document explains how to set up your environment, follow our workflow, and submit changes correctly.

---

## 🧰 Project Overview

**Angler_UI** is a Flutter-based mobile app that provides a modern fishing experience for users.  
We welcome contributions in the areas of:
- UI/UX improvements
- Bug fixes and performance optimization
- New feature development
- Documentation, tests, or localization

---

## 🧑‍💻 Development Setup

### 1. Prerequisites
Make sure you have:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest stable)
- Android Studio / VS Code
- Git & GitHub account

### 2. Verify your setup
```bash
flutter doctor
````

### 3. Clone the repository

```bash
git clone https://github.com/ikhwan20/Angler_UI.git
cd Angler_UI
```

### 4. Install dependencies

```bash
flutter pub get
```

### 5. Run the app

```bash
flutter run
```

---

# 🌿 Git Workflow

We use a **Feature Branch Workflow** with three main branches to keep our code organized and stable:

| Branch    | Purpose                       |
| --------- | ----------------------------- |
| `main`    | Stable, production-ready code |
| `staging` | QA and pre-release testing    |
| `develop` | Active development branch     |

All new features and fixes should branch from **`develop`** and merge back into it through a Pull Request.

---

### 1. Update local branches

Before starting any new work:

```bash
git checkout develop
git pull origin develop
```

---

### 2. Create a new branch

Always create a new branch for your work:

```bash
git checkout -b feature/your-feature-name
```

**Examples:**

```
feature/add-loading-widget
bugfix/fix-splash-layout
docs/update-readme
```

---

### 3. Make your changes

Write clean, readable, and documented code.

Run checks before committing:

```bash
flutter analyze
flutter test
```

---

### 4. Commit your changes

Use [Conventional Commits](https://www.conventionalcommits.org/) for clear commit messages:

```bash
git add .
git commit -m "feat: add loading widget under splash logo"
```

**Commit format:**

```text
<type>: <short description>

[optional body]
```

**Types:**

* `feat:` → New feature
* `fix:` → Bug fix
* `refactor:` → Code improvement
* `docs:` → Documentation only
* `test:` → Testing only
* `chore:` → Build, CI/CD, or maintenance task

---

### 5. Push your branch

```bash
git push origin feature/your-feature-name
```

---

## 🚀 Pull Request Workflow

1. Go to your fork/repo on GitHub and click **“New Pull Request”**
2. Set the base branch to **`develop`**
3. Use a clear PR title, for example:

   ```
   feat: add loading animation below splash logo
   ```
4. Fill out the **Pull Request Template** (GitHub will show it automatically)
5. Assign a reviewer if available
6. Link related issue(s) or project board item(s)
7. Wait for review → make updates if requested
8. Once approved, it will be merged into `develop`

After testing and validation:

* The **team lead** merges `develop` → `staging` for QA
* Once staging passes QA, it’s merged into `main` for production

✅ **Branch Flow**

```
feature → develop → staging → main
```

✅ **Checklist before opening a PR**

* [ ] Code compiles with no errors
* [ ] `flutter analyze` passes
* [ ] `flutter test` passes
* [ ] UI screenshots added (if relevant)
* [ ] Linked related issue or project item

---

## 🧱 Code Style Guidelines

Follow Flutter’s [Effective Dart](https://dart.dev/guides/language/effective-dart) conventions:

* Use 2-space indentation
* Prefer `const` constructors
* Use meaningful variable names
* Document complex logic with comments
* Keep widgets small and reusable

Run formatting automatically:

```bash
flutter format .
```

---

## 🧪 Testing

Before submitting your PR:

```bash
flutter test
```

If you add a new feature, please write at least one widget or unit test when possible.

---

## 🧩 Project Board Workflow

We use a **GitHub Project Board** to track tasks and progress.
Each issue or PR should be linked to the project board.

### Workflow Stages:

| Column         | Description                        |
| -------------- | ---------------------------------- |
| 📝 To Do       | Approved ideas and backlog items   |
| ⚙️ In Progress | Tasks currently being developed    |
| 👀 In Review   | Open pull requests awaiting review |
| ✅ Done         | Merged or completed work           |

To link your PR or issue:

1. Open the issue/PR on GitHub
2. Right sidebar → click **“Projects”**
3. Choose **Angler_UI Board**

---

## 💬 Communication

If you’re unsure about something:

* Open a [Discussion](https://github.com/ikhwan20/Angler_UI/discussions)
* Or create a **Draft PR** to start early feedback

---

## ❤️ Thank You

Your contributions help make **Angler_UI** better for everyone.
We appreciate your effort and ideas — happy coding! 🚀
