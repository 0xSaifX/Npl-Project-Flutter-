# Project Blueprint

## Overview

This document outlines the plan for creating a task management application based on the provided UI design. The application will be built using Flutter and will follow the visual and architectural guidelines specified.

## Style, Design, and Features

### Initial Version

*   **Theme:** A modern, clean theme with a dark blue primary color and a light background.
*   **Typography:** Custom fonts using `google_fonts`.
*   **Layout:** A responsive layout that works well on mobile devices.
*   **Home Screen:** A screen that displays an overview of tasks and projects.
*   **Task List:** A list of tasks with their progress.
*   **Navigation:** A bottom navigation bar for easy access to different sections of the app.

## Current Plan

*   **Step 1: Set up the project.**
    *   Create a `blueprint.md` file.
    *   Add the `google_fonts` dependency for custom typography.
*   **Step 2: Implement the application theme.**
    *   Define the color scheme and typography based on the design.
    *   Create a centralized `ThemeData` object.
*   **Step 3: Build the main application structure.**
    *   Create a `Scaffold` with a `BottomNavigationBar`.
    *   Implement the basic layout of the home screen.
*   **Step 4: Build the Home Screen UI components.**
    *   Create the "Hello, John!" header.
    *   Implement the tab bar for "My tasks", "Project", and "More".
    *   Create the project status cards.
    *   Create the task progress list.
*   **Step 5: Implement the other screens.**
    *   Build the "Tasks" screen.
    *   Build the "Create New Task" screen.
*   **Step 6: Refine and polish the UI.**
    *   Ensure all elements match the design.
    *   Add animations and transitions for a better user experience.
*   **Step 7: Code Refactoring (Completed)**
    *   Refactored `main.dart` into modular screens (`HomeScreen`, `TasksScreen`, `NewTaskScreen`, `ProfileScreen`).
    *   Created `lib/theme.dart`, `lib/utils.dart`, and `lib/widgets/app_drawer.dart` for better organization.
