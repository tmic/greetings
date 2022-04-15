# greetings
greetings.sh is a script that displays a greeting on login.
I added activation of the script in ~/.bashrc file. There may be other methods.

greetings_compilation.sh is a script that revises the actors list based on desired max actor height using the greetings_template.sh script.

## Technical considerarions
### Dependencies
Current script depends on
* fortune
* cowsay
* ddate
* cal

### Actor selection 
A byte from /dev/urandom is used because the value of $RANDOM variable was preserved on repeated shell activation in case script was activated by placing it in /etc/profile.d folder. That does not assure fair selection since the list of actors does not perfectly align into 256 values range, but I suppose it's good enough.

### Security considerations
Any software that runs on the system is additional attack surface. 
I'm not aware of any risks involved with scripts used here, but sensitive systems best kept simple and boring.
