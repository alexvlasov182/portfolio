---
title: "Todo Application with React Hooks and TypeScript"
summary: "A Todo Application project built using React with TypeScript, diving into React features like useContext and useMemo."
tags:
  [
    "React",
    "TypeScript",
    "useContext",
    "useMemo",
    "Todo Application",
    "Junior Developer Project",
  ]
categories: ["Projects", "React Development"]
author: "Oleksandr Vlasov"
featured_image: "/projects/react.png"
banner: "/projects/react.png"
---

![Setting Up the Project with Vite](/projects/react.png)

**Author:** Oleksandr Vlasov

**Live Demo:** [https://todo-application-rho-five.vercel.app/](https://todo-application-rho-five.vercel.app/)

**Blog RoyalZSoftware** [https://royalzsoftware.de/react-hooks-createcontext-usecontext-usememo](https://royalzsoftware.de/react-hooks-createcontext-usecontext-usememo)

As a junior React developer, I recently completed a project to build a Todo Application using **React** with **TypeScript**. The primary goal was to create a functional app and enhance my understanding of React hooks like `useState`, `useMemo`, and especially `useContext` for state management.

This app enables users to add, delete, mark tasks as complete, and download the to-do list as a CSV file. Here’s an overview of how I structured the app and applied these React hooks.

### 1. Setting Up the Project with Vite

To kickstart the project, I used **Vite** to create a fast, TypeScript-ready React environment:

```bash
npm create vite@latest my-todo-app --template react-ts
```

## Managing Todos with useState

The app's core functionality is the to-do list. Here's how I managed the state with `useState`.

#### TypeScript Code:

```typescript
export interface Todo {
  text: string;
  completed: boolean;
}

const [todos, setTodos] = useState<Todo[]>([]);
```

## Avoiding Prop Drilling with useContext

To avoid prop drilling, I used createContext to create a global state. Components accessed the state using useContext.

#### TypeScript Code:

```typescript
const TodoContext = createContext<TodoContextType | undefined>(undefined);
const { todos, addTodo, deleteTodo, toggleTodo } = useContext(TodoContext);
```

## Marking Todos as Complete/Incomplete

A checkbox toggles the completion status of each task.

#### TypeScript Code:

```typescript
function toggleTodo(index: number) {
  setTodos((prevTodos) =>
    prevTodos.map((todo, i) =>
      i === index ? { ...todo, completed: !todo.completed } : todo
    )
  );
}
```

## Deleting Todos

To delete a todo item, I used the filter() method.

#### TypeScript Code:

```typescript
function deleteTodo(index: number) {
  setTodos((prevTodos) => prevTodos.filter((_, i) => i !== index));
}
```

## Downloading the Todo List as CSV

I added a feature to download the to-do list as a CSV file.

#### TypeScript Code:

```typescript
const downloadCSV = () => {
  const dataCSV =
    "task,completed\n" +
    todos
      .map(
        (todo) => `${todo.text}, ${todo.completed ? "done" : "not completed"}`
      )
      .join("\n");

  const blob = new Blob([dataCSV], { type: "text/csv" });
  const url = window.URL.createObjectURL(blob);

  const a = document.createElement("a");
  a.href = url;
  a.download = "todo-list.csv";
  a.click();

  window.URL.revokeObjectURL(url);
};
```
