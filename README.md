# React Native Helper - README

## 📜 Overview

This batch script `ReactNativeHelper.bat` is a simple command-line tool for Windows to help manage your React Native development workflow. It provides a menu-driven interface to:

✅ Create new React Native projects
✅ Run your project on connected Android devices
✅ Stop all related background processes
✅ Quickly install or uninstall a set of recommended VS Code extensions for React Native development

---

## ⚙️ Features

### 1️⃣ **Create Project**

* Prompts you for a new project name.
* Runs `npx @react-native-community/cli init <projectName>` to create a new React Native project.
* Optionally removes the auto-created `.git` folder for a clean slate.
* Offers to run the project immediately after creation.

### 2️⃣ **Run Project**

* Checks if a `package.json` exists in the current directory.
* If found, checks connected Android devices and runs `npx react-native run-android` to build and launch the app.

### 3️⃣ **Stop React Native Processes**

* Force-kills common processes used by React Native (Metro bundler, Node, ADB, Emulator, Gradle).
* Frees up your system if you need to restart builds or fix stuck ports.

### 4️⃣ **Toggle VS Code Extensions**

* Provides an option to install or uninstall a recommended set of VS Code extensions:

  * ESLint (`dbaeumer.vscode-eslint`)
  * Prettier (`esbenp.prettier-vscode`)
  * React Native Tools (`msjsdiag.vscode-react-native`)
  * Path Intellisense (`christian-kohler.path-intellisense`)
  * Simple React Snippets (`burkeholland.simple-react-snippets`)
  * Tailwind CSS IntelliSense (`bradlc.vscode-tailwindcss`)

---

## 🚀 How to Use

1. **Download or copy the `EasyReactNative.bat` file** to any convenient location.

2. Add the location to **systems path**

3. **Run the script:**

   ```
   EasyReactNative.bat
   ```
   
   ```
   EasyReactNative
   ```

4. **Use the menu:**

   * Select `1` to create a new project.
   * Select `2` to run the project in the current folder.
   * Select `3` to stop all React Native processes.
   * Select `4` to install/uninstall VS Code extensions.
   * Select `5` to exit.

---

## ✅ Requirements

* **Node.js**, **NPM**, and **React Native CLI** must be installed.
* **ADB** must be in your system `PATH` for Android builds.
* **VS Code** must be installed if you want to manage extensions.
* **Connected Android device** for running builds.

---

## 📝 Notes

* When you create a new project, you can choose to delete the `.git` folder if you prefer initializing your own repository.
* The script uses `taskkill` to stop processes, so ensure you have appropriate permissions.
* You can easily customize the list of VS Code extensions inside the `.bat` file.

---

## 🤝 License

Feel free to use, modify, and share! This script is intended to speed up your local development workflow.

---

**Happy Coding!** 🚀
