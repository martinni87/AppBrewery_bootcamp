//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Martin Cordoba 15/08/2022.
//  For the App Brewery Bootcamp with Angela Yu.
//

import Foundation

struct StoryLevels {
    private var completeStory: Dictionary<Int,StoryStruct>
    private var currentStory: StoryStruct
    
    init(){
        completeStory =
        [
            1: StoryStruct(
                storyLine: "You're lost in the woods. But after a short time walking, you find two roads, each in one direction.\n\n\n What will you do?",
                choice1: Options(t: "Go left", p: 2),
                choice2: Options(t: "Go right", p: 3)),
            
            2: StoryStruct(
                storyLine: "You chose the left path. After a while the path is getting darker and darker.\n\n\n What will you do?",
                choice1: Options(t: "Keep going! I like taking nonsense risks!!", p: 4),
                choice2: Options(t: "Check if I have anything useful in my pockets", p: 5)),
            3: StoryStruct(
                storyLine: "You chose to go the \"RIGHT way, didn't you?🥁\". Through the fog you glimpse what it looks like an old cottage.\n\n\n What will you do?",
                choice1: Options(t: "Get closer and examine from the outside", p: 6),
                choice2: Options(t: "Get out! It gives me chills!", p: 4)),
            
            4: StoryStruct(
                storyLine: "Your call! The path is now so dark you can barely see where you put your feet on. You hear some wolves howling not so far away but you also see a spooky path at the right.\n\n\n What will you do?",
                choice1: Options(t: "Take the spooky path and look for some place to hide.", p: 3),
                choice2: Options(t: "YOLO, keep going...", p: 7)),
            5: StoryStruct(
                storyLine: "You found a lighter, a battery drained iPhone, some fluff and ... rotten chewing gum?? Yuck...\n\n\n What will you do?",
                choice1: Options(t: "This lighter seems useful, let's see if it works.", p: 8),
                choice2: Options(t: "Toss everything. I AM one with the force, the force is with me.", p: 7)),
            6: StoryStruct(
                storyLine: "It creeps the hell out of you!. But it really doesn't look SOOO dangerous.\n\n\n What will you do?",
                choice1: Options(t: "Check if I see anything useful.", p: 9),
                choice2: Options(t: "Get out...", p: 4)),
            
            7: StoryStruct(
                storyLine: "Dude, seriously. I think Darth Vader haven't go so far in the dark. You keep walking, but you freak out because of some noises.\n\n\n What will you do?",
                choice1: Options(t: "Start running while screaming!", p: 10),
                choice2: Options(t: "Start screaming while running!", p: 10)),
            8: StoryStruct(
                storyLine: "Nothing happens, looks like it doesn't work.\n\n\n What will you do?",
                choice1: Options(t: "Toss the lighter. Try to get the iPhone working.", p: 11),
                choice2: Options(t: "Eat the rotten chewing gum", p: 12)),
            9: StoryStruct(
                storyLine: "You find a a baseball bat. \n\n\n What will you do?",
                choice1: Options(t: "Let's do it! No one can beat me! Pick up the bat and go inside the house.", p: 13),
                choice2: Options(t: "Mehh... House really looks creepy... Leave the bat behind and go back the other path.", p: 2)),
            
            10: StoryStruct(
                storyLine: "You trip over and fall down hitting your head. You're dead. Better luck next time... I guess... 💀",
                choice1: Options(t: "Start over", p: 1),
                choice2: Options(t: "No more choices! Start again!", p: 1)),
            11: StoryStruct(
                storyLine: "What??? MAGICALLY the iPhone turns on! It just works! 😏 📱  You might use some apps to get out of the woods?",
                choice1: Options(t: "Try to use a map app", p: 14),
                choice2: Options(t: "Try to do some magic with your magic iPhone!! 🪄", p: 15)),
            12: StoryStruct(
                storyLine: "Really?? Like... rotten?? REALLY???... You're dead. No surprises at all.",
                choice1: Options(t: "Respawn please?", p: 1),
                choice2: Options(t: "INFINITE LOOP BUST!!!", p: 1)),
            13: StoryStruct(
                storyLine: "Ok. You get inside the house. You can go upstairs or open a closed door beneath the ladder.\n\n\n What will you do?",
                choice1: Options(t: "Open the closed door", p: 16),
                choice2: Options(t: "Go upstairs", p: 17)),
            
            14: StoryStruct(
                storyLine: "You have Apple Maps and Google Maps, both showing different paths to a safe place. Which one do you want to follow?",
                choice1: Options(t: "Let's use Apple maps ", p: 18),
                choice2: Options(t: "Let's use Google maps 🤖", p: 19)),
            15: StoryStruct(
                storyLine: "Oops... you forgot you're a muggle... A noseless dark wizard laughs at you and kills you. Now you're dead. Sorry!",
                choice1: Options(t: "Redire ad principium", p: 1),
                choice2: Options(t: "Try again", p: 1)),
            
            16: StoryStruct(
                storyLine: "Haven't you see any horror movie? NEVER open creepy doors inside creepy houses in a deep dark creepy night!!! Someone's inside!!\n\n\n What will you do?",
                choice1: Options(t: "Freak out at beat the hell out of it with the baseball bat!", p: 20),
                choice2: Options(t: "AVADA KEDAVRA!", p: 15)),
            17: StoryStruct(
                storyLine: "You go upstairs. There you see a week beam of white light through a door.\n\n\n What will you do?",
                choice1: Options(t: "Run Forest! Ruuun!!", p: 10),
                choice2: Options(t: "It can not be a vampire... they only glow during day light. Let's go inside.", p: 21)),
            18: StoryStruct(
                storyLine: "You trust on Apple Maps and leave the house. After six hours walking you get to a point where there're two paths.",
                choice1: Options(t: "Go to the left", p: 2),
                choice2: Options(t: "Go to the right", p: 3)),
            19: StoryStruct(
                storyLine: "You trust on Google Maps and leave the house. After six hundred GB of data collected, you see the end of the road. You're finally out! Congratulations!... Or aren't you? 👹",
                choice1: Options(t: "I'm out!", p: 1),
                choice2: Options(t: "Finally free!", p: 1)),
            
            20: StoryStruct(
                storyLine: "It's done... you beat it. You find a candle a some matches.",
                choice1: Options(t: "Use the candle and matches to see JUST what I fought with?", p: 22),
                choice2: Options(t: "Use the candle and matches to look around.", p: 23)),
            21: StoryStruct(
                storyLine: "You enter the room. There you see an iMac with Apple Maps and Google Maps, both showing different paths. Which one do you feel confident to follow?",
                choice1: Options(t: "Let's use Apple maps ", p: 18),
                choice2: Options(t: "Let's use Google maps 🤖", p: 19)),
            
            22: StoryStruct(
                storyLine: "Ok, so... you've just fought a tiny teddy bear. You ARE a the boy who lived... The candle light goes off.",
                choice1: Options(t: "Lumus!", p: 15),
                choice2: Options(t: "Get out now and go upstairs, I don't like this place.", p: 17)),
            23: StoryStruct(
                storyLine: "Cool! I like brave people! Unfortunately you woke up a demogorgon... Sorry! You're dead ☠️.",
                choice1: Options(t: "👁👄👁", p: 1),
                choice2: Options(t: "One last chance!", p: 1)),
            
        ]
        
        currentStory = completeStory[1]!
    }
    
    public func getCurrentStory() -> StoryStruct{
        return self.currentStory
    }
    
    mutating public func nextStory(selection: Int){
        self.currentStory = completeStory[selection]!
    }
    
}

