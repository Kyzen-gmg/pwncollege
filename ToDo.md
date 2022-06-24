# ToDo
"I hear and I forget.
I see and I remember.
I do and I understand." - Confucius

## Challenges
//Bat Computer - Read through the Assembly code and annotate/explain what's going on


## HackadayU
//calling conventions
https://sensepost.com/blogstatic/2014/01/SensePost_crash_course_in_x86_assembly-.pdf

https://wrongbaud.github.io/categories/ghidra/
https://hackaday.io/course/172292-introduction-to-reverse-engineering-with-ghidra

## misc

https://www.intezer.com/blog/research/executable-linkable-format-101-part1-sections-segments/
https://www.intezer.com/blog/malware-analysis/executable-linkable-format-101-part-2-symbols/
https://www.youtube.com/watch?v=d4Pgi5XML8E&t=592s
https://www.youtube.com/watch?v=uyWVztMHWtk&t=2s

https://www.bottomupcs.com/

https://exploit.courses/files/bfh2022/day1/
https://github.com/dobin/yookiterm-slides

https://github.com/JonathanSalwan/ROPgadget

https://www.reddit.com/r/oscp/comments/s0czjn/how_i_passed_oscp_with_90_score_roadmap_tips_and/
https://docs.pwntools.com/en/stable/rop/rop.html

https://www.learn-c.org/en/Variables_and_Types

https://niiconsulting.com/checkmate/2018/05/reverse-engineering-for-beginners-xor-encryption-windows-x64/
https://blog.devaviary.com/posts/cert-review/my-ecxd-review-tips.html

## CS
http://www.csc.villanova.edu/~mdamian/Past/csc2400fa13/index.html

## C
https://www.tutorialspoint.com/assembly_programming/assembly_logical_instructions.htm
http://www.csc.villanova.edu/~mdamian/Past/csc2400fa13/Schedule.html  
- http://www.csc.villanova.edu/~mdamian/Past/csc2400fa13/notes/08_Assembly.pdf
- http://www.csc.villanova.edu/~mdamian/Past/csc2400fa13/notes/09-AssemblyAddressing.pdf

### Supplemental Resources:
https://www.learn-c.org/en/Hello%2C_World%21  
https://www.youtube.com/watch?v=KJgsSFOSQv0&list=PLWKjhJtqVAbmUE5IqyfGYEYjrZBYzaT4m  
https://www.youtube.com/watch?v=zuegQmMdy8M  

## Bit Shifting:
https://www.interviewcake.com/concept/java/bit-shift  

## Two's complement:
https://www.interviewcake.com/concept/python/binary-numbers?#twos-complement


## assembly
//crazy one
https://bdigital.uvhm.edu.mx/wp-content/uploads/2020/07/Reverse-Engineering-for-Beginners.pdf

https://gist.github.com/DtxdF/7d0ccfac01edd010d5e1d3dacc475d81
https://www.youtube.com/watch?v=d4Pgi5XML8E&t=592s
https://www.cs.virginia.edu/~evans/cs216/guides/x86.html
https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html
https://cs.lmu.edu/~ray/notes/x86overview/

https://www.godevtool.com/GoasmHelp/newass.htm

void setup(void)
{
    setvbuf(_stdin, 0, 2, 0);
    setvbuf(_stdout, 0, 2, 0);
    alarm(0x7f);
    return;
}


DRAEGER15th30n34nd0nly4dm1n15tr4t0R0fth15sp4c3cr4ft 


Focus on C language Vulnerabilities
memcpy
bufferoverflow
printf
read

sully -
boofuzz -
afl - file fuzzes binaries 
python script de-xor'

Don't do python -c 

what is
context vs context.update
r.interactive vs r.close

# Resources
https://exploit.education/phoenix/
http://smashthestack.org/wargames

- Discord - Reverse Engineering: https://discord.gg/PSfAu8N
A fantastic community present on Discord is the Reverse Engineering. It has people from all over
at all different positions and skill levels. I find it particularly useful for asking questions or just
trying out challenges and stuff.
 
- CTF TIME: https://ctftime.org
A site that lists upcoming CTFs. This is a great way to keep track of CTFs to enter.
 
- Corelan.be: https://www.corelan.be/index.php/articles/
Specifically focusing on their 'Exploits' section to get familiar with a common process to
approaching VR.
-- https://www.corelan.be/index.php/category/security/exploit-writing-tutorials/
An amazing collection of articles that cover the different stages and writing up of exploits.
 
- Microcorruption: https://microcorruption.com/
An awesome practice CTF that encompasses taking on an unknown "device" progressing through
increasingly difficult challenges.
 
- Over the Wire: https://overthewire.org/wargames/
These start off pretty easy and advance to some decent challenges, but they can be nice to fill in
some gaps you may have.
 
- Smash The Stack: http://smashthestack.org/wargames
Similar to Over the Wire with the same concept of challenges of varying type.
 
- "Smashing the stack in 2010": http://www.mgraziano.info/docs/stsi2010.pdf
Great paper over modern buffer overflows on Linux and Windows systems.
 
- "Reddit - netsec": https://www.reddit.com/r/netsec/
Great subreddit that has frequent updates, writeups, and all-things security that lean more
technical than typical articles.
 
- "Reddit - ReverseEngineering": https://www.reddit.com/r/ReverseEngineering/
Another technical subreddit with a focus on reverse engineering as a whole.
 
- "Reddit - NetsecStudents": https://www.reddit.com/r/netsecstudents/
This subreddit is geared more towards people that are trying to get familiar with
netsec-related topics.
 
- "Reddit - securityCTF": https://old.reddit.com/r/securityCTF/
With CTFs being the main focus of this subreddit, you will find everything from
people developing CTFs, working together to solve challenges, or solutions and
approaches others took.
 
- "Reddit - lowlevel": https://old.reddit.com/r/lowlevel/
A subreddit focused on lowlevel aspects of computers. Not very active, but posts tend to
be high quality.
 
- "Reddit - Emulation": https://old.reddit.com/r/emulation/
A subreddit focused on emulation of video game consoles. Similar to lowlevel, not a
particularly security-focused community, but very into understanding computers of all
types.
 
Books:
 
- "Hacking: The Art of Exploitation":
  https://www.amazon.com/Hacking-Art-Exploitation-Jon-Erickson/dp/1593271441
 
- "Gray Hat Hacking The Ethical Hackers Handbook":
  https://www.amazon.com/Gray-Hacking-Ethical-Hackers-Handbook/dp/0071742557
 
- “The Ghidra Book”
https://nostarch.com/GhidraBook
 
- "The IDA Pro Book: The Unofficial Guide to the World's Most Popular Disassembler":
  https://www.amazon.com/The-IDA-Pro-Book-Disassembler/dp/1593272898
This one is specific to IDA and is great if you're looking to grow more familiar with using IDA.
 
- "The Art of Software Security Assessment: Identifying and Preventing Software Vulnerabilities":
  https://www.amazon.com/Art-Software-Security-Assessment-Vulnerabilities/dp/0321444426/
 
Bonus:
phrack.org
PoC || GTFO
https://www.alchemistowl.org/pocorgtfo/
How2Heap
https://heap-exploitation.dhavalkapil.com/attacks/