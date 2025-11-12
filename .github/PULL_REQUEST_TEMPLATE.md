# 📝 Pull Request Template

## 🧩 Summary
Briefly explain what this PR does and why it's needed.

> Example: Added a loading animation below the splash logo to improve UX.

---

## 🔧 Changes Made
List the main changes introduced in this PR.

- [ ] Added new loading widget
- [ ] Updated splash screen layout
- [ ] Fixed animation timing bug

---

## 🧠 Type of Change
Select one or more that apply:

- [ ] ✨ New feature (non-breaking change)
- [ ] 🐛 Bug fix (non-breaking change)
- [ ] ⚙️ Refactor (code improvement)
- [ ] 🧪 Tests (added/updated tests)
- [ ] 📝 Documentation update
- [ ] 🚨 Breaking change (fix or feature that would cause existing functionality to change)

---

## 🧩 Related Issues / Project Tasks
Link any related issues or project board items here.

> Example: Closes #12, Linked to “Add Splash Loading Widget” in Project Board

---

## ✅ Checklist
Before marking this PR ready for review, confirm you have:

- [ ] Code compiles with no errors  
- [ ] `flutter analyze` passes  
- [ ] `flutter test` passes  
- [ ] Added/updated necessary documentation  
- [ ] Linked related issues/project item  
- [ ] Screenshots or video attached (if UI change)

---

## 🧪 Testing Instructions
Provide steps for reviewers to test this PR:

```bash
# Example
git checkout develop
git pull origin develop
git checkout feature/add-loading-widget
flutter run
````

Expected result: Splash screen shows app logo + loading animation underneath.

---

## 📸 Screenshots (if applicable)

| Before | After |
| ------ | ----- |
|        |       |

---

## 👀 Reviewer Notes

Anything specific you’d like reviewers to check or be aware of?

````

---

## 🧠 Step 3: Commit and Push It

In your terminal:

```bash
git add .github/PULL_REQUEST_TEMPLATE.md
git commit -m "docs: add pull request template"
git push
````

---

## ✅ Step 4: Test It

Now go to your GitHub repo → click **“Pull requests” → “New pull request”**.
You should automatically see the new PR template appear in the description box.
