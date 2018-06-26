# ss18_showmaster
Roboy wishes to be more entertaining and impressive. With his new skills he is reliably able to attract people to its presence independent to their relation to him. He appeals as well to an audience as to a group of developers, satisfying both of their preferences.


## About
This repository consists of four sections to make Roboy more entertaining on fairs.
1. Facial Expressions to show more emotions
2. Generative Model for Chitchat
3. Vision Module
4. Additions to Dialog for playing games

Roboy Showmaster team wants to combine these sections to have an immersive and entertaining conversation.


## How it works


### 1. Facial Expressions
In addition to the old faces and expression in Unity, the following faces are added and can be triggered via ROS:
 - suprised Roboy
 - crying Roboy
 - irritated Roboy
 - Roboy wearing sunglasses
 - *but how*?

### 2. Generative Models
The old Generative Model was neither a state of the art implementation nor did it use a state of the art dataset as a basis. The new model is originating from Facebooks Dialog Research Platform [ParlAI](https://github.com/facebookresearch/ParlAI/). There, several possible implementations as well as several datasets are integrated in one platform. 

### 3. Vision Module
The ROS Service Server receives service calls from the dialog as Strings that hold the desired filter. The vision module streams the video information from Roboy's camera to an iPad and applies the requested filter to the detected faces. The algorithm uses OpenCV and dlib library finding 68 facial landmarks to detect the most important face charateristics and to estimate the tilt angle of the face. The required filter mask is then applied automatically in-face superposition in real time. Following filters have been implemented: Roboy mask, mustache, pixelated sunglasses, flies, hat, crown and rainbow.

### 4. Dialog Games
The Dialog implements two games: 

- The 20 questions game using an Akinator Wrapper API that is run in children protection mode and 

- the Snapchat-Game that communicates with the Vision Server and requests the desired filters through service calls.


## Getting Started

### Prequisites and Setup
- for Emotions refer to [RoboyUnityFace](https://github.com/Roboy/RoboyUnityFace)
- for ParlAI refer to [ParlAI](https://github.com/Roboy/ParlAI/)
- for Games refer to [Roboy_Dialog](https://github.com/Roboy/roboy_dialog)
- for Snapchat refer to [Roboy_Snapchat](https://github.com/Roboy/roboy_snapchat)

### Running ROS service
- Start rosmaster in terminal with 
```
roscore
```

#### Emotions


#### ParlAI
- in terminal, run 
```
roslaunch rosbridge_server rosbridge_websocket.launch
```
- in a new terminal
- activate virtual environment 
- in `ss18_showmaster/DeepQA_ParlAI/ros_integration` run 
```
python gnlp_ros_srv.py
```
#### Snapchat
- In a new terminal, go to /roboy_snapchat_filter/scripts/ directory and start the vision server with 
```
rosrun roboy_snapchat_filter snapchat_server.py
```
#### Games
- included in dialog

#### Start Dialog
**!make sure ros servers are running before attempting to start dialog!**
- execute
```
java -Xmx6g -d64 -cp dialog/target/roboy-dialog-system-2.1.9-jar-with-dependencies.jar \
roboy.dialog.DialogSystem- 
```

