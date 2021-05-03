# Pursuit-Core-iOS-Unit2-Assessment

# Github Instructions
- Clone this repository to your machine
- Add and commit your changes as you work on the assessment
- Complete the assessment and push up on your own branch
- Create a pull request to the repo here
- Paste the link of your PR into Canvas

# The Assessment

### Overview

Your app will display a table full of crayon colors, and clicking on a color will show you a view that lets you mess around with that color's red, green, blue and alpha values.

### Project Componenets:

Inside this repo, you will find a ```Crayon``` model that has:

- var name: String
- var red: Double
- var green: Double
- var blue: Double
- var hex: String
- static let allTheCrayons: [Crayon]

There is also an empty Storyboard.  You have no existing View Controllers, so you will need to create your own.

### The Requirements 

Load ```allTheCrayons``` into a ```Table View```.  

- The name in each row should be the Crayon's **name**.  
- The subtitle in each row should be the Crayon's **hex** value.  
- The background color of each row should be the Crayon's color (derived from the Crayon's **red**, **green** and **blue**.  

When the user selects a row, you should segue to a Detail View.   The Detail view should have:

- A ```UILabel``` to show the **name** of the selected Crayon
- A background color that starts as the same color as the selected Crayon.
- A ```UISlider``` and ```UILabel``` that represents the current **red** value
- A ```UISlider``` and ```UILabel``` that represents the current **green** value
- A ```UISlider``` and ```UILabel``` that represents the current **blue** value
- A ```UIStepper``` and ```UILabel``` that represents the current **alpha**
- A reset ```UIButton``` that sets all the sliders and labels to be the corresponding colors of the Crayon the user selected and resets the alpha to 1.0.

The values of each of the sliders should start at the appropriate values from the selected Crayon.  The range of each slider should be between 0.0 and 1.0.

The value of the stepper should start at 1.0.  The range of the stepper should be from 0.0 to 1.0.

As the user manipulates the sliders and stepper, the background color should change accordingly in real time.


### Steps to achieve MVP (Minimal Viable Product)

1. Set the background color of the rows by building a ```UIColor``` from with the ```Crayon``` model's red, green, and blue properties and set the textLabel's text to the color name. You **don't** need to make a custom ```TableViewCell```
to do this. Just use the default ```UITableViewCell```.

1. Implement ```prepare(for:)``` on your ```View Controller``` or ```TableViewController``` in order to pass the color information over to the Detail ```ViewController```. This Detail ```ViewController``` should have a label with the color name and color its background just as you did with the table cell row. The ```Sliders``` should be in the correct posititons as specifed by the tapped color's **RGB value**.

1. Build your Detail view controller and connect outlets and actions as appropriate to the  ```Slider``` and ```Stepper``` controls and your ```Labels```. Use one ```Label``` to display the Color's name, and four ```Labels``` below each ```Slider``` and ```Stepper``` that live-update when the ```Sliders``` or ```Stepper``` changes their values.

1. Add your ```Stepper```, which increases or decreases your ```Alpha``` value by **0.1** when tapped. 

1. Add a ```UIButton``` which should reset all your sliders/stepper/labels to their appropriate staring values based on the passed in Crayon.


#### A note on color

The following initializer will be helpful:

```swift
UIColor(displayP3Red:green:blue:alpha:)
```

All four arguments to the initializer are of type CGFloat and expect a value between 0.0 and 1.0.

The doubles provided for the Crayon values are from 0 from 255.  You will need to convert them proportionally to the appropriate CGFloat by dividing by 255.



#### Extra Credit
Do any of the below, or none at all:

1. Create a convenience initializer on the ```Crayon``` model that uses the "hex" field to populate the the red, green, blue properties for your crayons. 

1. Use ```TextFields```, instead of ```Labels```, to show each RGB value. Typing in a value manually should affect the respective slider's positions and update the background color.

1. Have the ```Labels``` change to a lighter color to make it easier to read once the view gets too dark.

1. Create a segmented control with two titles "Decimal" and "Hex".  If "Decimal" is selected, the labels should all be in decimal between 0 and 1.  If "Hex" is selected, the labels should all be in hex between 0 and FF.

# Rubric

![rubric](https://github.com/joinpursuit/Pursuit-Core-iOS-Unit2-Assessment/blob/master/Unit2Rubric.png)

