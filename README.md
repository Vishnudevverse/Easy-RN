# Faster React Native Development


## 📜 Overview

This batch script `react-native-helper.bat` is a simple command-line tool for Windows to help manage your React Native development workflow. It provides a menu-driven interface to:

- Create new React Native projects  
- Run your project on connected Android devices  
- Stop all related background processes  
- Quickly install or uninstall a set of recommended VS Code extensions  
- Scaffold a standard folder structure with placeholder files  

---

## ⚙️ Features

### 1️⃣ Create Project

- Prompts you for a new project name.  
- Runs `npx @react-native-community/cli init <projectName>` to bootstrap a React Native project.  
- Optionally removes the auto-created `.git` folder for a clean slate.  
- Offers to run the project immediately after creation.  

### 2️⃣ Run Project

- Detects if a `package.json` exists in the current directory.  
- Checks connected Android devices and runs `npx react-native run-android` to build and launch the app.  

### 3️⃣ Stop React Native Processes

- Force-kills common processes used by React Native (Metro bundler, Node, ADB, Emulator, Gradle).  
- Frees up your system if you need to restart builds or fix stuck ports.  

### 4️⃣ Toggle VS Code Extensions

- Install or uninstall a curated set of VS Code extensions:

  - ESLint (`dbaeumer.vscode-eslint`)  
  - Prettier (`esbenp.prettier-vscode`)  
  - React Native Tools (`msjsdiag.vscode-react-native`)  
  - Path Intellisense (`christian-kohler.path-intellisense`)  
  - Simple React Snippets (`burkeholland.simple-react-snippets`)  
  - Tailwind CSS IntelliSense (`bradlc.vscode-tailwindcss`)  

### 5️⃣ Initialize Project Structure

- Automatically creates a `src` directory with subfolders:

  - `assets/fonts`  
  - `assets/images`  
  - `components/Button`  
  - `components/Avatar`  
  - `features/auth/screens`  
  - `features/auth/hooks`  
  - `features/todos`  
  - `navigation`  
  - `hooks`  
  - `services`  
  - `store`  
  - `styles`  
  - `types`  
  - `utils`  
  - `config`  

- Generates placeholder files for key parts of your app:

  - `App.tsx`, component files, style files  
  - Auth screens and hooks, API and slice  
  - Navigation setup and types  
  - Custom hooks (`useDebounce`, `useNetInfo`)  
  - Service helpers (API client, billing, ads)  
  - Store configuration and root reducer  
  - Styling constants (colors, typography)  
  - Shared types, utilities, and config entrypoint  

---

## 🚀 How to Use

1. Download or copy the `EasyReactNative.bat` file to any convenient location.

2. (Optional) Add the script’s folder to your system `PATH` for easy access.

3. Run the script:

   ```batch
   react-native-helper.bat
   ```

4. In the menu, choose:

   1. **Create Project**  
   2. **Run Project**  
   3. **Stop React Native Processes**  
   4. **Toggle VS Code Extensions**  
   5. **Initialize Project Structure**  
   6. **Exit**  

---

## ✅ Requirements

- **Node.js**, **NPM**, and **React Native CLI** installed.  
- **ADB** available in your system `PATH` for Android builds.  
- **VS Code** installed to manage extensions.  
- **Connected Android device** (or emulator) for running builds.  

---

## 📝 Notes

- Deleting the `.git` folder on project creation gives you a fresh repository.  
- The script uses `taskkill` to stop processes—run your terminal as Administrator if permissions issues arise.  
- Customize your VS Code extensions list by editing the `%EXTENSIONS%` variable in the `.bat` file.  

---

## 🤝 License

Feel free to use, modify, and share! This script is intended to speed up your local React Native development workflow.

---

**Happy Coding!** 🚀
