
# Br&ndcamp

Brandcamp (not sure about this being the _actual_ name maybe it's just an informal one?) is a set of processes that create greater understanding of a developing or already-existing brand, quickly.

While our main goal is creating clarity, our secondary goal is team building. The organization going through this process should be having fun, not feeling like we are burdening them with extra work. 

At the end of Brandcamp, we should have a stronger team and a healthy amount of "buy in" from the key players.

The process can be run online when needed, or a hybrid of both online and in person.

## Online process

Quick and dirty description of the steps involved

- Send an email to the group inviting them to take part in the process
- Build out a form using Gravity Forms on a Wordpress site: [JSON](https://github.com/EMRL/brandcamp/blob/main/gf/json/gravityforms-export.json) 
- After a certain time period, close the form and export the entries
- Examine the spreadsheet of entries, and make sure you remove any extra columns that are not needed
- Save the first 3 columns of personality traits to a new file: [Example](https://github.com/EMRL/brandcamp/blob/main/gf/example.csv)
- Save the "More X than Y" statements to their own file:[Example](https://github.com/EMRL/brandcamp/blob/main/gf/comparison-example.csv)
- Run `./bc.sh /path/to/file.csv` to process the personality traits file
- Run `./bc.sh -c /path/to/file.csv` to process the comparison statements file

## The big picture process

The process consists of two parts: 

### Part 1:  Creating understanding
Hopefully this can be done in person with smaller clients, larger/remote workforce clients will need to have this done through online forms.

**Post-it jam session**

 - [ ] What words describe your organization?
 - [ ] What words describe your clients?
 - [ ] What words describe your industry as a whole?
 - [ ] What are some of the best success moments you've experienced as an organization? (What qualities did that moment represent)
 - [ ] And close with the least quantifiable exercise: More __________ than ____________. _Encourage silliness_

**Interpreting the results**

 - [ ] Group words in two buckets, _evocative_ and _descriptive_ starting with organization words, then client words. When doing the post-it jam session, **this is theater** 
 - [ ] Listen to stories of success moments, tag the word groups that can be seen in these stories
 - [ ] Visualize as data
 - [ ] Summarize with statistics
 - [ ] Create wordbank derived from those themes that cross both organization and customer

**Summary statistics example**

    90 keywords identified
    16 personality traits defined
    53% describe ourselves
    47% describe those we serve
    86% helped create our best moments
    64% of personality traits describe both us and those we serve

**Delivering the results**

Part 1's final product is a presented deck that explains our interpreted results. Ideally for smaller organizations, this will be in-person. The idea is walk them through the results, playing to their nostalgia of going through the process to get here. 

The **more ______ than _______** component is likely gonna have some funny shit in it so play that up.

The delivery deck should be designed so that a person the organization who was not part of the process could understand what they are looking at. Make sure it starts with a "Goal" statement slide. This can be a reusable, universal statement.

### Part 2: Rapid prototyping
Needs big brain

 - [ ] Make the client look cool
 - [ ] Send them an invoice
 - [ ] Profit
