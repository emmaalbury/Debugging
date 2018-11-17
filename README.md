# Debugging
This is 4 debugging exercises completed. You can see the original versions in the bottom of each file and the debugged version up the top. Please see instructions for these exercises here https://hackmd.io/s/rJsXYjUcb

Debugging procedures for exercise 4 -

Suggested process:

1. Read error messages
2. Pinpoint the bug (look at the line where the error message is directing,
   follow the flow, create visibility using puts statements, binding.pry, irb etc)
3. Break the problem down into smaller pieces
3. Check assumptions
4. Read documentation (language documentation, stack overflow etc)
5. If a solution is not found, break the code down into even smaller pieces
and repeat the above process

Expanded explanation:

First issue:
Step 1: Take a look at the error messages in the command line. In this case it is - "debugging4.rb:4:in `+': nil can't be coerced into Integer (TypeError)".
Take a look at line 4 (where the error message is pointing you) and see what it is referring to. It's giving you a "TypeError".
So take a look at the object you are using and consider what type of object it is and how those kinds of objects can be used.
Can it behave in the way you are currently asking it to? If not, what do you need to do to make it so? If you don't know these answers.....
Step 2: Read documentation. If you don't understand the error message, google it (or refer to a relevant book). If you look at the Rudy doc for "TypeError"
(https://ruby-doc.org/core-2.2.0/TypeError.html) you can see "Raised when encountering an object that is not of the expected type." Good. The above assumption was correct.
So now inspect the object type and how it can behave. Currently a string object is being directed to behave like an integer. By researching docs you will learn that strings
and integers and different object types and therefore have different behaviour. Look at the docs to determine what script you can use to alter the behaviour of the object types,
enabling shared behaviour. In this case, converting the string to an integer ".to_i" will fix the problem.
Step 3: Add ".to_i" and run the file from the command line again. This error should no longer appear.

Second issue:
Step 1: Make some assumptions and then check these assumptions. How should your program be behaving? Look at the command line output. Is it what is expected? In this case, no.
The decode method is returning the correct characters, but in an incorrect order. So what does this mean? Break the code down into smaller pieces. Look at what is working and what isn't.
A good way to achieve this is by creating visibility by inserting "puts" statements in your script so you can see the output of each step when running your program in the command line.
The encode method appears to be returning the correct result. So you can focus on the decode method and add "puts" statements where you like (e.g you could "puts" cipher, ciphertext_chars,
char, plaintext_chars etc). By doing this you can narrow down that the issue lies at line 12: "cipher[65 - char.ord]". Why? How do you expect this to behave, how is it behaving differently and why is this?
Comparing it to the above code (the encode method) to see how and why that was working and what the differences are. If that isn't enough, look at more documentation on the object and method types and how they should be.
Step 2: If you are still stuck, break it down more. Try to talk through the steps of your program (and assumptions of what each line is doing) out loud. By communicating it, it will help to clarify your understanding of how each part is working
and enable the parts that aren't doing what you wrote them to be to stand out. By dissecting your code you might even find silly errors stand out, which you might have otherwise overlooked.
Step 3: If the previous steps don't work you could try to write things out and draw diagrams of what you think should happen vs what is really happening. Compare the two. In this case you'll probaby find that there's
an issue on line 12: cipher[65 - char.ord]. Consider what this line should be doing vs what result this sum will give us. Should it be 65 - char.ord or char.ord - 65?

Third issue:
Step 1: Look at the return value of decode. It's currently "theswiftfoxjumpedoverthelaydog" instead of "theswiftfoxjumpedoverthelazydog". It's missing a "z". Why do you think this is?
Use one of the methods mentioned above to break down your program to determine where the error is. Look at line 2 - cipher = key.chars.uniq + ((‘a’…’z’).to_a - key.chars)
and line 10 - cipher = key.chars.uniq + ((‘a’...’z’).to_a - key.chars). What does each of these methods mean? How does range work?
Step 2: Check documentation. See ruby “range” documentation https://ruby-doc.org/core-2.2.0/Range.html. It says "Ranges constructed using .. run from the beginning to the end inclusively.
Those created using ... exclude the end value." Which do you think you should be using? ".." or "..."? Why not change the range to ".." and see if that works?

Congrats! You've successfully debugged your code! Give yourself a treat : )
