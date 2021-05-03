# Introduction to Table Views Lab

In this lab, you will complete a task list.  In the starter project, there is a `Task.swift` file.  A `Task` object is defined below:

```swift
struct Task {
    enum Status {
        case notStarted
        case inProgress
        case completed
    }

    let name: String
    let status: Status
    let dueDate: Date

    static var allTasks: [Task] {
      //Tasks returned here
    }
```

Your task is to build a Table View that displays all of the tasks to the user.

## Part One:

Display all of the tasks in a list.  Each cell should contain:

- the name of the task
- the date that it is due.  

You can use the `dueDate`'s `description` property to change it from a `Date` into a `String`

![gifOne](https://github.com/joinpursuit/Pursuit-Core-iOS-TableView-Introduction-Lab/blob/master/gifs/stepOneIntroTableViewLab.gif)

## Part Two

Instead of using a single list, break the tasks up into three sections:

- Not Started
- In Progress
- Completed


HINT: You'll need the delegate method `titleForHeaderInSection` to set the section titles
HINT: It will help to store an object `tasks` of type `[[Task]]`

![gifTwo](https://github.com/joinpursuit/Pursuit-Core-iOS-TableView-Introduction-Lab/blob/master/gifs/stepTwoIntroTableViewLab.gif)

## Part Three (Challenge)

Add a button at the top that sorts each section in either ascending or descending order

![gifThree](https://github.com/joinpursuit/Pursuit-Core-iOS-TableView-Introduction-Lab/blob/master/gifs/finalIntroTableViewLab.gif)
