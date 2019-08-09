//
//  ArrayClass.swift
//  SignLearning
//
//  Created by Zain on 09/01/2017.
//  Copyright © 2017 Zain. All rights reserved.
//

import UIKit

class ArrayClass: NSObject {
    var a : [String] = ["aeroplane-min","afternoon-min","again-min","age-min","ages-min","agree-min","apple-min","arch-min","art-min","asleep-min","asthma-min","autumn-min"]
    
    var b : [String] = ["baby-min","ball-min","banana-min","barbeque-min","bath-min","bean-min","bear-min","best-min","bird-min","birthday-min","biscuit-min","blind-min","boat-min","bones-min","book-min","boy-min","bread-min","break-min","breakfast-min","bridge-min"]
    
    var c : [String] = ["camera-min","car-min","cat-min","cattle-min","cereal-min","cheese-min","cherry-min","chewing-gum-min","chicken-min","chocolate-min","christmas-min","circle-min","clothes-min","clothing-min","coffee-min","cold-min","congratulatiuons-min","cookie-min","correct-min"]
    
    var d : [String] = ["dad-min","dark-min","day-min","deaf-min","deer-min","difficult-min","dog-min","doughnut-min","drink-min","duck-min"]
    
    var e : [String] = ["easter-min","easy-min","eat-min","egg-min","eight-8-min","elf-min","end-min","england-min","environment-min","equality-min","essential-min","exercise-min"]
    
    var f : [String] = ["fairy-min","family-min","fast-min","father-christmas-2-min","father-christmas-santa-min","female-min","feminine-min","final-min","fire-min","fireworks-min","fish-min","five-min","flag-min","flight-min","food-min","four-min","freezing-min","friend-min","frozen-min"]
    
    var g : [String] = ["ghost-min","gift-min","girl-min","give-up-min","glass-min","gold-min","good-min","goodbye-min","gorilla-min","grapes-min","great-min","greedy-min","grumpy-min"]
    
    var h : [String]  = ["halloween-min","happy-min","happy-new-year-min","hard-min","hat-min","health-min","healthy-min","hello-min","help-min","hero-min","hi-min","holiday-2-min","holiday-min","honest-min","horse-min","house-min","how-are-you-min","how-old-are-you-min","husband-min"]
    
    var i : [String] = ["i-love-you-min","i-min","ice-cream-min","ice-min","important-min","individual-min","interpretor-min","ireland-min","irish-min"]
    var  j : [String] = ["jigsaw-puzzle"]
    
    var k : [String] = ["kind-min","knife-min"]
    
    var l : [String] = ["lady-min","language-min","lass-min","last-min","learn-min","leisure-min","library-min","love-min","lunch-min"]
    
    var m : [String] = ["male-min","man-min","masculine-min","mathematics-min","maths-min","me-min","meal-min","meat-min","meet-min","merry-christmas-min"]
    
    var n : [String] = ["name-min","neighbour-min","new-min","next-min","nice-min","night-min","nine-min","number-min","nurse-min","nut-min"]
    var o : [String] = ["octopus-min","office-min","one-min","opposite-min"]
    
    var p : [String] = ["pancake-min","pants-min","paper-min","party-min","pasta-min","pastry-min","peace-min","penguin-min","person-min","pet-min","photo-min","photograph-min","pie-min","pig-min","pink-min","pizza-min","plane-min","plant-min","please-min","popcorn-min"]
    var q : [String] = ["quick-min","quickly-min","quiet-min","quit-min"]
    
    var r : [String] = ["rabbit-min","rain-min","rainbow-min","raisins-min","read-min","reception-min","reindeer-min","relax-2-min","relax-min","relaxation-min","remember-min","repeat-min","ribs-min","rocket-min"]
    
    var s : [String] = ["sad-min","sandwich-min","santa-2-min","santa-claus-min","sattelite-min","sausages-min","sceince-min","school-2-min","school-min","scissors-min","scotland-min","scottish-min","secret-min","secretary-min","seven-min","ship-min","shoe-min","shoes-min","sick-min","sign-langauage-min"]
    
    var u : [String] = ["umbrella-min"]
    
    var v : [String] = ["valentine-min","vampire-min","veg-min","vegetable-min","vegetables-min","vegetarian-min","vital-min","voluntary-min","volunteer-min","vote-min"]
    
    var t : [String] = ["tea-min","teacher-min","technology-min","television-min","ten-min","tennis-min","tent-min","thank-you-min","thanks-min","thirsty-min","three-min","tie-min","time-min","toilet-min","tomato-min","towel-min","tree-min","trousers-min","truth-min","tumbler-min"]
    
    var w : [String] = ["wales-min","walk-2-min","walk-min","water-min","weekend-min","welcome-min","welsh-min","whale-min","what-min","where-min","who-min","wife-min","winter-min","witch-min","woman-min","work-min","workout-min","world-min"]
    
    var y : [String] = ["year-min","yesterday-min","you-min","your-min","youre-welcome-min","yours-min"]
    
    
    
    /// Label Text Arrays 
    
    
    var aText : [String] = ["aeroplane","afternoon","again","age","ages","agree","apple","arch","art","asleep","asthma","autumn"]
    
    var bText : [String] = ["baby","ball","banana","barbeque","bath","bean","bear","best","bird","birthday","biscuit","blind","boat","bones","book","boy","bread","break","breakfast","bridge"]
    
    var cText : [String] = ["camera","car","cat","cattle","cereal","cheese","cherry","chewing-gum","chicken","chocolate","christmas","circle","clothes","clothing","coffee","cold","congratulatiuons","cookie","correct"]
    
    var dText : [String] = ["dad","dark","day","deaf","deer","difficult","dog","doughnut","drink","duck"]
    
    var eText : [String] = ["easter","easy","eat","egg","eight-8","elf","end","england","environment","equality","essential","exercise"]
    
    var fText : [String] = ["fairy","family","fast","father-christmas-2","father-christmas-santa","female","feminine","final","fire","fireworks","fish","five","flag","flight","food","four","freezing","friend","frozen"]
    
    var gText : [String] = ["ghost","gift","girl","give-up","glass","gold","good","goodbye","gorilla","grapes","great","greedy","grumpy"]
    
    var hText : [String]  = ["halloween","happy","happy-new-year","hard","hat","health","healthy","hello","help","hero","hi","holiday-2","holiday","honest","horse","house","how-are-you","how-old-are-you","husband"]
    
    var iText : [String] = ["i-love-you","i","ice-cream","ice","important","individual","interpretor","ireland","irish"]
    var  jText : [String] = ["jigsaw-puzzle"]
    
    var kText : [String] = ["kind","knife"]
    
    var lText : [String] = ["lady","language","lass","last","learn","leisure","library","love","lunch"]
    
    var mText : [String] = ["male","man","masculine","mathematics","maths","me","meal","meat","meet","merry-christmas"]
    
    var nText : [String] = ["name","neighbour","new","next","nice","night","nine","number","nurse","nut"]
    var oText : [String] = ["octopus","office","one","opposite"]
    
    var pText : [String] = ["pancake","pants","paper","party","pasta","pastry","peace","penguin","person","pet","photo","photograph","pie","pig","pink","pizza","plane","plant","please","popcorn"]
    var qText : [String] = ["quick","quickly","quiet","quit"]
    
    var rText : [String] = ["rabbit","rain","rainbow","raisins","read","reception","reindeer","relax-2","relax","relaxation","remember","repeat","ribs","rocket"]
    
    var sText : [String] = ["sad","sandwich","santa-2","santa-claus","sattelite","sausages","sceince","school-2","school","scissors","scotland","scottish","secret","secretary","seven","ship","shoe","shoes","sick","sign-langauage"]
    
    var uText : [String] = ["umbrella"]
    
    var vText : [String] = ["valentine","vampire","veg","vegetable","vegetables","vegetarian","vital","voluntary","volunteer","vote"]
    
    var tText : [String] = ["tea","teacher","technology","television","ten","tennis","tent","thank-you","thanks","thirsty","three","tie","time","toilet","tomato","towel","tree","trousers","truth","tumbler"]
    
    var wText : [String] = ["wales","walk-2","walk","water","weekend","welcome","welsh","whale","what","where","who","wife","winter","witch","woman","work","workout","world"]
    
    var yText : [String] = ["year","yesterday","you","your","youre-welcome","yours"]

}
