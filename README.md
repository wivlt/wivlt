## WIVLT ![main workflow](https://github.com/wivlt/wivlt/actions/workflows/test.yml/badge.svg?branch=main)

### Motivation
One of the challenges of having ADHD is ending a productive day without fully remembering what I’ve absorbed. Small but important details can slip away—insights that could be better understood, referenced later, or even shared. Especially when it's time to reflect on your growth, share progress with teammates or leaders, or build a case for a raise, it helps to have these discoveries documented.

My goal with **WIVLT** (pronounced *Weevleet*) is to make it simple to capture what you’ve picked up each day and easily export that knowledge when you need it.

Here are some practical examples of how you can register new takeaways:
```bash
# Add projects and tags
wivlt "Grouping while limiting documents using the firstN operator" @awesome_project #mongodb #mongooperator #nosql

# Add a reference link from a non-tech routine
wivlt "Drinking a glass of water right after waking up helps with energy and focus throughout the morning" @morning_routine #health #habits #hydration !https://healthline.com/nutrition/water-after-waking-up

# Add a general thought, with no project, tags, or links
wivlt "Brian Eno is the original composer of Heroes"
```

And here’s how you can export your notes:
```bash
# Display today’s insights in the terminal
wivlt --today

# Export this week’s records as a PDF file
wivlt --this-week --f pdf

# Export last month’s captured knowledge for a specific purpose (e.g. salary raise)
wivlt --past-month --t salary_raise
```

### Main Features
1. Quickly register something new you've learned today.
   Example: `wivlt "How to group using MongoDB firstN command" @hatch #mongodb #backend`
2. Export your personal knowledge base, filtered by project or tags.
3. Generate summaries of your captured insights—daily, weekly, or monthly.

### Main Goals
1. Make it effortless to document valuable information from work, reading, or spontaneous ideas—helping you recognize your daily growth and reflection.
2. Share your records with leaders, teammates, or yourself—filtered by project, tags, or timeframe (daily, weekly, monthly).
3. Receive meaningful summaries and reviews powered by AI.
