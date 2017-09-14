mysql -u root --local-infile finance < setup.sql
python summarize.py
